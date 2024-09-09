// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: prefer_const_constructors

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'entity.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `get_icon_to_win_icon_by_win`, `icon_info_to_entity`, `window_info_to_entity`

/// Retrieves the active window.
///
/// Returns the active window as an `Option` type.
/// If the active window cannot be retrieved, `None` is returned.
///
/// # Example
///
/// ```
/// let active_window = get_active_window().unwrap();
/// ```
WindowIconEntity getCurrentActiveWindow() =>
    RustLib.instance.api.crateApiActiveWindowWindowGetCurrentActiveWindow();

/// Retrieves a list of active windows and their corresponding icons.
///
/// This function uses the `get_open_windows` function to get a list of open windows.
/// It then iterates over the windows and uses the `get_icon_to_win_icon_by_win` function
/// to retrieve the icon for each window. The resulting list of `WindowIconEntity` structs
/// is collected and returned.
///
/// # Returns
///
/// A vector of `WindowIconEntity` structs representing the active windows and their icons.
///
/// # Panics
///
/// This function will panic if there is an error retrieving the open windows.
///
/// # Examples
///
/// ```rust
/// let active_window: Vec<WindowIconEntity> = get_active_windows();
/// ```
List<WindowIconEntity> getAllOpenWindows() =>
    RustLib.instance.api.crateApiActiveWindowWindowGetAllOpenWindows();

IconEntity getWindowIconByWindowId({required int id}) => RustLib.instance.api
    .crateApiActiveWindowWindowGetWindowIconByWindowId(id: id);
