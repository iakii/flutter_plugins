//! 自定义 HTTP Fetcher，修复 response.url 返回重定向后最终 URL 的问题。
//!
//! 上游 `BlockingReqwestFetcher` 将原始请求 URL（`request.uri()`）传给
//! `JsResponse::basic()`，导致重定向后 `response.url` 仍返回原始地址。
//! 本实现改用 `resp.url()` 获取 reqwest 跟随重定向后的最终 URL。

use std::cell::RefCell;
use std::rc::Rc;

use boa_engine::{Context, Finalize, JsData, JsError, JsResult, JsString, Trace};
use boa_runtime::fetch::request::JsRequest;
use boa_runtime::fetch::response::JsResponse;
use boa_runtime::fetch::Fetcher;

/// 基于 reqwest 阻塞客户端的 Fetcher，能正确报告重定向后的最终 URL。
#[derive(Default, Debug, Clone, Trace, Finalize, JsData)]
pub(crate) struct RedirectAwareFetcher {
    #[unsafe_ignore_trace]
    client: reqwest::blocking::Client,
}

impl Fetcher for RedirectAwareFetcher {
    async fn fetch(
        self: Rc<Self>,
        request: JsRequest,
        _context: &RefCell<&mut Context>,
    ) -> JsResult<JsResponse> {
        let request = request.into_inner();
        let url = request.uri().to_string();

        let req = self
            .client
            .request(request.method().clone(), &url)
            .headers(request.headers().clone())
            .body(request.body().clone())
            .build()
            .map_err(JsError::from_rust)?;

        let resp = self.client.execute(req).map_err(JsError::from_rust)?;

        // 关键：在 resp.bytes() 消费响应之前获取最终 URL（重定向后的地址）
        let final_url = resp.url().to_string();

        let status = resp.status();
        let headers = resp.headers().clone();
        let bytes = resp.bytes().map_err(JsError::from_rust)?;

        let mut builder = http::Response::builder().status(status.as_u16());
        for k in headers.keys() {
            for v in headers.get_all(k) {
                builder = builder.header(k.as_str(), v);
            }
        }

        builder
            .body(bytes.to_vec())
            .map_err(JsError::from_rust)
            .map(|inner| JsResponse::basic(JsString::from(final_url), inner))
    }
}
