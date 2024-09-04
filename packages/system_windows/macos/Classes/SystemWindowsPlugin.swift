import Cocoa
import FlutterMacOS
import AppKit

public class SystemWindowsPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "unitedideas.co/system_windows", binaryMessenger: registrar.messenger)
        let instance = SystemWindowsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "getActiveApps":
                result(getActiveApps())
            case "hasScreenRecordingPermission":
                result(hasScreenRecordingPermission())
            case "active":
                let arguments = call.arguments as! String
                setActived(bundleIdentifier:arguments)
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
        }
    }

    private func getActiveApps() -> String {
        var windows = Array<SystemWindow>()
        let ws = NSWorkspace.shared
        let apps = ws.runningApplications

        for currentApp: NSRunningApplication in apps {
            if(currentApp.activationPolicy == .regular){
                var title = ""
                let visibleWindows = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as! [[String: Any]]
                for window in visibleWindows {
                    let windowOwnerPID = window[kCGWindowOwnerPID as String] as! pid_t

                    if(windowOwnerPID == currentApp.processIdentifier) {
                        title =  window[kCGWindowName as String] as? String ?? ""
                    }
                }
                let systemWindow = SystemWindow(
                    name: currentApp.localizedName!,title: title, isActive: currentApp.isActive, icon: currentApp.icon!.base64String!,bundleIdentifier:currentApp.bundleIdentifier!);
                windows.append(systemWindow)
            }
        }

        do {
            let jsonData = try JSONEncoder().encode(windows)
            let jsonString = String(data: jsonData, encoding: .utf8)!

            return jsonString
        } catch { print(error) }

        return "";
    }

    func hasScreenRecordingPermission() -> Bool {
        CGDisplayStream(
            dispatchQueueDisplay: CGMainDisplayID(),
            outputWidth: 1,
            outputHeight: 1,
            pixelFormat: Int32(kCVPixelFormatType_32BGRA),
            properties: nil,
            queue: DispatchQueue.global(),
            handler: { _, _, _, _ in }
        ) != nil
    }

    func setActived(bundleIdentifier:String) {
      print("bundleIdentifier===\(bundleIdentifier)")
        let ws = NSWorkspace.shared
        let app = ws.runningApplications.filter{app in return app.bundleIdentifier==bundleIdentifier}.first!
        // if(apps==nil)return nil;
        print(app)
        app.activate();
    }

}

struct SystemWindow: Codable {
    var name : String;
    var title : String;
    var isActive : Bool;
    var icon : String
    var bundleIdentifier : String
}



extension NSImage {
    var base64String: String? {
        guard let rep = NSBitmapImageRep(
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
            ) else {
                print("Couldn't create bitmap representation")
                return nil
        }

        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
        draw(at: NSZeroPoint, from: NSZeroRect, operation: .sourceOver, fraction: 1.0)
        NSGraphicsContext.restoreGraphicsState()

        guard let data = rep.representation(using: NSBitmapImageRep.FileType.png, properties: [NSBitmapImageRep.PropertyKey.compressionFactor: 1.0]) else {
            print("Couldn't create PNG")
            return nil
        }

        // With prefix
        // return "data:image/png;base64,\(data.base64EncodedString(options: []))"
        // Without prefix
        return data.base64EncodedString(options: [])
    }
}
