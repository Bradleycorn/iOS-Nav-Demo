import SwiftUI

/// A view for displaying user notifications.
///
/// This view presents a list of notifications for the user, typically showing
/// recent activity, updates, or important messages within the app.
///
/// Usage:
/// This view is usually the root view of the notifications tab in the main tab view.
///
/// Example:
/// ```swift
/// TabView {
///     NotificationsView()
///         .tabItem {
///             Label("Notifications", systemImage: "bell")
///         }
///     // Other tabs...
/// }
/// ```
struct NotificationsView: View {
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    /// A sample array of notifications. In a real app, this would likely be fetched from a data source.
    let notifications = [
        "New message from User1",
        "Your post received 10 likes",
        "Friend request from User2",
        "New comment on your photo",
        "Reminder: Event starting in 1 hour"
    ]
    
    var body: some View {
        List {
            ForEach(notifications.indices, id: \.self) { index in
                Button(action: {
                    // Navigate to the relevant part of the app based on the notification
                    handleNotificationTap(index: index)
                }) {
                    Text(notifications[index])
                        .foregroundColor(.primary)
                }
            }
        }
        .navigationTitle("Notifications")
    }
    
    /// Handles the action when a notification is tapped.
    /// - Parameter index: The index of the tapped notification in the `notifications` array.
    private func handleNotificationTap(index: Int) {
        // This is a simple example. In a real app, you'd have more complex logic
        // to determine where each notification should navigate to.
        switch index {
        case 0:
            coordinator.navigate(to: .tabItem(.messages))
        case 1, 3:
            coordinator.navigate(to: .detail(itemId: index))
        case 2:
            coordinator.navigate(to: .profile(userId: "User2"))
        default:
            coordinator.navigate(to: .home)
        }
    }
}
