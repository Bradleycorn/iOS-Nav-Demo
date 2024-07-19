import SwiftUI

/// A view that wraps a `NavigationStack` for each tab.
///
/// This view manages the navigation stack for a single tab. It uses the
/// `NavigationCoordinator` to handle navigation actions and maintain the
/// navigation state.
///
/// Usage:
/// Create an instance of this view for each tab in your `MainTabView`.
///
/// Example:
/// ```swift
/// NavigationStackView(stack: coordinator.tabStacks[.feed] ?? NavigationPath())
///     .tabItem {
///         Label("Feed", systemImage: "list.bullet")
///     }
/// ```
struct NavigationStackView: View {
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    /// The navigation stack for this view.
    let stack: NavigationPath
    
    var body: some View {
        NavigationStack(path: Binding(
            get: { stack },
            set: { newValue in
                coordinator.tabStacks[coordinator.selectedTab] = newValue
            }
        )) {
            ContentView(tab: coordinator.selectedTab)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    case .profile(let userId):
                        ProfileView(userId: userId)
                    case .settings:
                        SettingsView()
                    case .detail(let itemId):
                        DetailView(itemId: itemId)
                    case .tabItem:
                        EmptyView() // This shouldn't happen in navigationDestination
                    }
                }
        }
    }
}
