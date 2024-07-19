import SwiftUI

/// Represents the various routes in the application.
///
/// Use this enum to define the navigation structure of your app. Each case represents a
/// distinct destination or state in the app's navigation flow.
///
/// Example usage:
/// ```swift
/// let profileRoute = AppRoute.profile(userId: "user123")
/// coordinator.navigate(to: profileRoute)
/// ```
enum AppRoute: Hashable {
    /// The home screen of the app.
    case home
    /// A user's profile screen.
    /// - Parameter userId: The unique identifier of the user.
    case profile(userId: String)
    /// The settings screen.
    case settings
    /// A detail screen for a specific item.
    /// - Parameter itemId: The unique identifier of the item.
    case detail(itemId: Int)
    /// Represents a tab in the main tab view.
    /// - Parameter TabItem: The specific tab item.
    case tabItem(TabItem)
    
    /// Represents the main tabs in the application.
    enum TabItem: Hashable {
        /// The feed tab.
        case feed
        /// The messages tab.
        case messages
        /// The notifications tab.
        case notifications
    }
}
