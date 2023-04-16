import Cocoa
import FlutterMacOS

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
   
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)

    override func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarIcons"))
            button.action = #selector(statusItemClicked(_:))
        }
        
//        let menu = NSMenu()
//        menu.addItem(NSMenuItem(title: "Print", action: #selector(AppDelegate.printString(_:)), keyEquivalent: "P"))
//        menu.addItem(NSMenuItem.separator())
//        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
//
//        statusItem.menu = menu
        
        super.applicationDidFinishLaunching(aNotification)
        
    }
    
    @objc func statusItemClicked(_ sender: Any?) {
        // handle the click event
//        let mainWindow = NSApplication.shared.mainWindow
//        mainWindow?.makeKeyAndOrderFront(nil)
        
//        NSApp.activateIgnoringOtherApps(true)
        
        let app = NSApplication.shared
        app.setActivationPolicy(.regular)
        app.activate(ignoringOtherApps: true)
        app.run()
    }

    
    @objc func printString(_ sender: Any?) {
        print("Hello MacOS")
    }

    
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
}
