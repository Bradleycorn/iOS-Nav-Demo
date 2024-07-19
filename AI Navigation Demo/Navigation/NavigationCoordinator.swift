import SwiftUI

/// Manages the navigation state and logic for the application.
///
/// This class serves as the central hub for handling navigation in your app. It manages
/// the navigation stacks for each tab and provides methods for navigating between different
/// routes, handling deep links, and managing the overall navigation state.
///
/// To use the `NavigationCoordinator`:
/// 1. Create an instance and inject it into your view hierarchy using `@StateObject` and `.environmentObject()`.
/// 2. Use the `navigate(to:)` method to perform navigation actions.
/// 3. Access the `selectedTab` and `tabStacks` properties to reflect the current navigation state in your views.
///
/// Example usage:
/// ```swift
/// class ContentView: View {
///     @EnvironmentObject var coordinator: NavigationCoordinator
///
///     var body: some View {
///         Button("Go to Settings") {
///             coordinator.navigate(to: .settings)
///         }
///     }
/// }
/// ```
class NavigationCoordinator: ObservableObject {
    /// The currently selected tab.
    @Published var selectedTab: AppRoute.TabItem = .feed

    /// The navigation stacks for each tab.
    ///
    /// This dictionary maintains separate navigation paths for each tab, allowing for
    /// independent navigation histories within each tab of the app.
    @Published var tabStacks: [AppRoute.TabItem: NavigationPath] = [
        .feed: NavigationPath(),
        .messages: NavigationPath(),
        .notifications: NavigationPath()
    ]
    
    /// Navigates to a specified route.
    /// - Parameter route: The route to navigate to.
    ///
    /// Use this method to programmatically navigate to different parts of your app.
    /// If the route is a tab item, it will switch to that tab. Otherwise, it will
    /// push the route onto the current tab's navigation stack.
    ///
    /// Example:
    /// ```swift
    /// coordinator.navigate(to: .profile(userId: "user123"))
    /// ```
    func navigate(to route: AppRoute) {
        switch route {
        case .tabItem(let tab):
            selectedTab = tab
        default:
            tabStacks[selectedTab]?.append(route)
        }
    }
    
    /// Navigates back one step in the current tab's navigation stack.
    ///
    /// Call this method to programmatically go back to the previous view in the current tab.
    ///
    /// Example:
    /// ```swift
    /// Button("Go Back") {
    ///     coordinator.navigateBack()
    /// }
    /// ```
    func navigateBack() {
        tabStacks[selectedTab]?.removeLast()
    }
    
    /// Navigates to the root of the current tab's navigation stack.
    ///
    /// Use this method to clear the entire navigation stack for the current tab and
    /// return to the root view.
    ///
    /// Example:
    /// ```swift
    /// Button("Go to Root") {
    ///     coordinator.navigateToRoot()
    /// }
    /// ```
    func navigateToRoot() {
        tabStacks[selectedTab] = NavigationPath()
    }
    
    /// Handles deep links to navigate to specific parts of the app.
    /// - Parameter url: The URL representing the deep link.
    ///
    /// This method parses incoming URLs and navigates to the appropriate part of the app.
    /// It's typically called in response to the app being opened via a deep link.
    ///
    /// Example:
    /// ```swift
    /// .onOpenURL { url in
    ///     coordinator.handleDeepLink(url)
    /// }
    /// ```
    func handleDeepLink(_ url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host else {
            return
        }
        
        let queryItems = components.queryItems ?? []
        
        switch host {
        case "home":
            navigate(to: .home)
        case "profile":
            if let userId = queryItems.first(where: { $0.name == "userId" })?.value {
                navigate(to: .profile(userId: userId))
            }
        case "settings":
            navigate(to: .settings)
        case "detail":
            if let itemIdString = queryItems.first(where: { $0.name == "itemId" })?.value,
               let itemId = Int(itemIdString) {
                navigate(to: .detail(itemId: itemId))
            }
        default:
            print("Unknown deep link: \(url)")
        }
    }
}
