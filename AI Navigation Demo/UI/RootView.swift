import SwiftUI

/// The root view of the application.
///
/// This view initializes the `NavigationCoordinator` and injects it into the
/// environment for use by child views. It serves as the top-level container
/// for your app's main navigation structure.
///
/// Usage:
/// Place this view at the root of your app's view hierarchy.
///
/// Example:
/// ```swift
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             RootView()
///         }
///     }
/// }
/// ```
struct RootView: View {
    /// The navigation coordinator for the app.
    @StateObject private var coordinator = NavigationCoordinator()
    
    var body: some View {
        MainTabView()
            .environmentObject(coordinator)
    }
}

