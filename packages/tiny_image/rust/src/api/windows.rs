use std::{
    mem::MaybeUninit,
    ptr::{self, addr_of_mut},
};

use windows::{
    core::{IUnknown, InParam, Interface, Result},
    Win32::{
        Foundation::{HWND, S_FALSE},
        System::{
            Com::{
                CoCreateInstance, CoInitializeEx, CoTaskMemFree, CoUninitialize,
                CLSCTX_LOCAL_SERVER, COINIT_APARTMENTTHREADED, COINIT_DISABLE_OLE1DDE, VARIANT,
            },
            Ole::{IEnumVARIANT, VT_DISPATCH},
        },
        UI::Shell::{
            IPersistIDList, IShellBrowser, IShellItem, IShellWindows, IUnknown_QueryService,
            SHCreateItemFromIDList, SID_STopLevelBrowser, ShellWindows,
            SIGDN_DESKTOPABSOLUTEPARSING,
        },
    },
};

use windows::Win32::UI::WindowsAndMessaging::GetForegroundWindow;

pub fn get_select_file() -> Result<()> {
    let _ = unsafe {
        CoInitializeEx(
            ptr::null(),
            COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE,
        )
    };

    let windows: IShellWindows =
        unsafe { CoCreateInstance(&ShellWindows, None, CLSCTX_LOCAL_SERVER) }?;
    dump_windows(&windows)?;

    Ok(())
}

fn get_location_from_view(browser: &IShellBrowser) -> Result<Vec<u16>> {
    let shell_view = unsafe { browser.QueryActiveShellView() }?;
    let persist_id_list: IPersistIDList = shell_view.cast()?;
    let id_list = unsafe { persist_id_list.GetIDList() }?;

    let mut item = MaybeUninit::<IShellItem>::uninit();
    unsafe { SHCreateItemFromIDList(id_list, &IShellItem::IID, addr_of_mut!(item) as _) }?;

    let item = unsafe { item.assume_init() };

    let ptr = unsafe { item.GetDisplayName(SIGDN_DESKTOPABSOLUTEPARSING) }?;

    // Copy UTF-16 string to `Vec<u16>` (including NUL terminator)
    let mut path = Vec::new();
    let mut p = ptr.0 as *const u16;
    loop {
        let ch = unsafe { *p };
        path.push(ch);
        if ch == 0 {
            break;
        }
        p = unsafe { p.add(1) };
    }

    // Cleanup
    unsafe { CoTaskMemFree(ptr.0 as _) };
    unsafe { CoTaskMemFree(id_list as _) };

    Ok(path)
}

fn get_browser_info<'a, P>(unk: P, hwnd: &mut HWND) -> Result<Vec<u16>>
where
    P: Into<InParam<'a, IUnknown>>,
{
    let shell_browser: IShellBrowser =
        unsafe { IUnknown_QueryService(unk, &SID_STopLevelBrowser) }?;
    *hwnd = unsafe { shell_browser.GetWindow() }?;

    get_location_from_view(&shell_browser)
}

fn dump_windows(windows: &IShellWindows) -> Result<()> {
    let unk_enum: IUnknown = unsafe { windows._NewEnum() }?;
    let enum_variant = unk_enum.cast::<IEnumVARIANT>()?;
    loop {
        let mut fetched = 0;
        let mut var: [VARIANT; 1] = [VARIANT::default(); 1];
        let hr = unsafe { enum_variant.Next(&mut var, &mut fetched) };
        // No more windows?
        if hr == S_FALSE || fetched == 0 {
            break;
        }
        // Not an IDispatch interface?
        if unsafe { var[0].Anonymous.Anonymous.vt } != VT_DISPATCH.0 as _ {
            continue;
        }

        // Get the information
        let mut hwnd = Default::default();
        let location = get_browser_info(
            unsafe {
                var[0]
                    .Anonymous
                    .Anonymous
                    .Anonymous
                    .pdispVal
                    .as_ref()
                    .unwrap()
            },
            &mut hwnd,
        )?;

        // Convert UTF-16 to UTF-8 for display
        let location = String::from_utf16_lossy(&location);
        println!("Explorer location: \"{}\"", location);
    }

    Ok(())
}

pub fn get_current_path() {
    let _ = unsafe {
        CoInitializeEx(
            ptr::null(),
            COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE,
        )
    };
    // 获取前台窗口
    let mut hwnd: HWND = unsafe { GetForegroundWindow() };
    if hwnd == HWND::default() {
        return;
    }
    let location = get_browser_info(
        unsafe {
            VARIANT::default()
                .Anonymous
                .Anonymous
                .Anonymous
                .pdispVal
                .as_ref()
                .unwrap()
        },
        &mut hwnd,
    )
    .unwrap();
    // Convert UTF-16 to UTF-8 for display
    let location = String::from_utf16_lossy(&location);
    println!("Explorer location: \"{}\"", location);

    // 释放 COM
    unsafe { CoUninitialize() };
}
