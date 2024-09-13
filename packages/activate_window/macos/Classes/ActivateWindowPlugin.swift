import FlutterMacOS
import Cocoa

public class ActivateWindow: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "activate_window_plugins", binaryMessenger: registrar.messenger)
    let instance = ActivateWindow()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getAllWindows":
      let windows = NSApplication.shared.orderedWindows
      var windowInfos: [[String: Any]] = []
      for window in windows {
        let windowInfo: [String: Any] = ["id": window.windowNumber, "title": window.title]
        windowInfos.append(windowInfo)
      }
      result(windowInfos)
    case "activateWindow":
      if let args = call.arguments as? [String: Any], let windowId = args["id"] as? Int {
        let windows = NSApplication.shared.orderedWindows
        if let window = windows.first(where: { $0.windowNumber == windowId }) {
          window.makeKeyAndOrderFront(nil)
          result(true)
        } else {
          result(FlutterError(code: "NO_SUCH_WINDOW", message: "No window with the given ID exists.", details: nil))
        }
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "The 'id' argument is missing or not an integer.", details: nil))
      }
    case "getCurrentWindow":
      if let window = NSApplication.shared.keyWindow {
        let icon = NSWorkspace.shared.icon(forFile: Bundle.main.bundlePath)
        let imageData = icon.tiffRepresentation
        let base64Icon = imageData?.base64EncodedString()
        let windowInfo: [String: Any] = ["id": window.windowNumber, "title": window.title, "icon": base64Icon ?? ""]
        result(windowInfo)
      } else {
        result(FlutterError(code: "NO_ACTIVE_WINDOW", message: "No active window.", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
