import SwiftUI

/// The main tab view of the application.
///
/// This view sets up the tab-based navigation structure of the app. It uses the
/// `NavigationCoordinator` to manage the selected tab and the navigation stack
/// for each tab.
///
/// Usage:
/// This view is typically used as the main content view of your `RootView`.
///
/// Example:
/// ```swift
/// struct RootView: View {
///     var body: some View {
///         MainTabView()
///             .environmentObject(NavigationCoordinator())
///     }
/// }
/// ```
struct MainTabView: View {
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            NavigationStackView(stack: coordinator.tabStacks[.feed] ?? NavigationPath())
                .tabItem {
                    Label("Feed", systemImage: "list.bullet")
                }
                .tag(AppRoute.TabItem.feed)
            
            NavigationStackView(stack: coordinator.tabStacks[.messages] ?? NavigationPath())
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
                .tag(AppRoute.TabItem.messages)
            
            NavigationStackView(stack: coordinator.tabStacks[.notifications] ?? NavigationPath())
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
                .tag(AppRoute.TabItem.notifications)
        }
    }
}
