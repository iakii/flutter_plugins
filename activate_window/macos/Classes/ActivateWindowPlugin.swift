import AppKit
import Cocoa
import FlutterMacOS

public class ActivateWindowPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "activate_window_plugin", binaryMessenger: registrar.messenger)
    let instance = ActivateWindowPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getAllWindows":
      let windows = NSApp.windows
      var windowInfos: [[String: Any]] = []
      for window in windows {
        let windowInfo: [String: Any] = ["id": window.windowNumber, "title": window.title]
        windowInfos.append(windowInfo)
      }
      result(windowInfos)
    case "activateWindow":
      let bundleIdentifier = call.arguments as! String

      print("swift :" + bundleIdentifier)

      if let app = NSRunningApplication.runningApplications(
        withBundleIdentifier: bundleIdentifier
      ).first {
        app.activate(options: [.activateIgnoringOtherApps])
      } else {
        print("No running applications with the bundle identifier \(bundleIdentifier)")
      }
      result(nil)
    case "getCurrentWindow":

      let workspace = NSWorkspace.shared
      let frontmostApp = workspace.frontmostApplication
      // 应用的本地化名称
      let appName = frontmostApp?.localizedName
      // 应用的bundle标识符
      let bundleIdentifier = frontmostApp?.bundleIdentifier
      // let appPath = frontmostApp?.bundleURL.path  // 应用的路径

      let windowInfo: [String: Any] = [
        // "isActive": frontmostApp?.isActive,
        "title": appName!,
        "bundleIdentifier": bundleIdentifier!,
        "icon": frontmostApp?.icon!.b64!,
      ]

      result(windowInfo)
    default:
      result(FlutterMethodNotImplemented)
    }

  }
}

extension NSImage {
  var b64: String? {
    guard
      let rep = NSBitmapImageRep(
        bitmapDataPlanes: nil,
        pixelsWide: Int(size.width),
        pixelsHigh: Int(size.height),
        bitsPerSample: 16,
        samplesPerPixel: 4,
        hasAlpha: true,
        isPlanar: false,
        colorSpaceName: .calibratedRGB,
        bytesPerRow: 0,
        bitsPerPixel: 0
      )
    else {
      print("Couldn't create bitmap representation")
      return nil
    }

    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
    draw(at: NSZeroPoint, from: NSZeroRect, operation: .sourceOver, fraction: 1.0)
    NSGraphicsContext.restoreGraphicsState()

    guard
      let data = rep.representation(
        using: NSBitmapImageRep.FileType.png,
        properties: [NSBitmapImageRep.PropertyKey.compressionFactor: 1.0])
    else {
      print("Couldn't create PNG")
      return nil
    }

    // With prefix
    // return "data:image/png;base64,\(data.base64EncodedString(options: []))"
    // Without prefix
    return data.base64EncodedString(options: [])
  }
}
