use std::sync::Arc;

pub use aria2_ws::{Callbacks, Client, TaskOptions};
use flutter_rust_bridge::frb;
use futures::FutureExt;
use serde_json::json;
use tokio::sync::broadcast;
use tokio::{spawn, sync::Semaphore};

async fn example() {
    let client = Client::connect("ws://127.0.0.1:6800/jsonrpc", None)
        .await
        .unwrap();
    let options = TaskOptions {
        split: Some(2),
        header: Some(vec!["Referer: https://www.pixiv.net/".to_string()]),
        // Add extra options which are not included in TaskOptions.
        extra_options: json!({"max-download-limit": "100K"})
            .as_object()
            .unwrap()
            .clone(),
        ..Default::default()
    };

    let mut not = client.subscribe_notifications();
    spawn(async move {
        loop {
            match not.recv().await {
                Ok(msg) => println!("Received notification {:?}", &msg),
                Err(broadcast::error::RecvError::Closed) => {
                    println!("Notification channel closed");
                    break;
                }
                Err(broadcast::error::RecvError::Lagged(_)) => {
                    println!("Notification channel lagged");
                }
            }
        }
    });

    // use `tokio::sync::Semaphore` to wait for all tasks to finish.
    let semaphore = Arc::new(Semaphore::new(0));
    client
        .add_uri(
            vec![
                "https://i.pximg.net/img-original/img/2020/05/15/06/56/03/81572512_p0.png"
                    .to_string(),
            ],
            Some(options.clone()),
            None,
            Some(Callbacks {
                on_download_complete: Some({
                    let s = semaphore.clone();
                    async move {
                        s.add_permits(1);
                        println!("Task 1 completed!");
                    }
                        .boxed()
                }),
                on_error: Some({
                    let s = semaphore.clone();
                    async move {
                        s.add_permits(1);
                        println!("Task 1 error!");
                    }
                        .boxed()
                }),
            }),
        )
        .await
        .unwrap();

    // Will 404
    client
        .add_uri(
            vec![
                "https://i.pximg.net/img-original/img/2022/01/05/23/32/16/95326322_p0.pngxxxx"
                    .to_string(),
            ],
            Some(options.clone()),
            None,
            Some(Callbacks {
                on_download_complete: Some({
                    let s = semaphore.clone();
                    async move {
                        s.add_permits(1);
                        println!("Task 2 completed!");
                    }
                        .boxed()
                }),
                on_error: Some({
                    let s = semaphore.clone();
                    async move {
                        s.add_permits(1);
                        println!("Task 2 error!");
                    }
                        .boxed()
                }),
            }),
        )
        .await
        .unwrap();

    // Wait for 2 tasks to finish.
    let _ = semaphore.acquire_many(2).await.unwrap();

    // Force shutdown aria2.
    // client.force_shutdown().await.unwrap();
}

#[frb]
pub struct AriaClient {
    client: Client,
    options: TaskOptions,
}

impl AriaClient {
    pub async fn connect(url: String) -> Self {
        let client = Client::connect(url.as_str(), None)
            .await
            .unwrap();

        let options = TaskOptions {
            split: Some(8),
            ..Default::default()
        };

        AriaClient { client, options }
    }

    pub fn set_global_option(&mut self, option: TaskOptions) {
        self.options = option;
    }

    pub fn add_url(&self, url: String, options: Option<TaskOptions>) {
        let client = self.client.clone();
        spawn(async move {
            client
                .add_uri(
                    vec![url],
                    Some(self.options.clone()),
                    None,
                    Some(Callbacks {
                        on_download_complete: Some({
                            async move {
                                println!("Task completed!");
                            }
                                .boxed()
                        }),
                        on_error: Some({
                            async move {
                                println!("Task error!");
                            }
                                .boxed()
                        }),
                    }),
                )
                .await
                .unwrap();
        });
    }
}
