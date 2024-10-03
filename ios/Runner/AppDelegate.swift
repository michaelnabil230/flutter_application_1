import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Register Flutter plugins
        GeneratedPluginRegistrant.register(with: self)

        // Set up SwiftFlutterForegroundTaskPlugin
        SwiftFlutterForegroundTaskPlugin.setPluginRegistrantCallback(registerPlugins)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

func registerPlugins(registry: FlutterPluginRegistry) {
    GeneratedPluginRegistrant.register(with: registry)
}
