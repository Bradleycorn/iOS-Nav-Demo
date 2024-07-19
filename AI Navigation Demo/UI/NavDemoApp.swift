import SwiftUI

@main
struct NavDemoApp: App {
    /// The navigation coordinator for the app.
    @StateObject private var coordinator = NavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(coordinator)
                .onOpenURL { url in
                    coordinator.handleDeepLink(url)
                }
        }
    }
}
