import SwiftUI

/// A view for displaying and managing user messages.
///
/// This view shows a list of user conversations or messages, allowing
/// users to view and interact with their communications within the app.
///
/// Usage:
/// This view is typically the root view of the messages tab in the main tab view.
///
/// Example:
/// ```swift
/// TabView {
///     MessagesView()
///         .tabItem {
///             Label("Messages", systemImage: "message")
///         }
///     // Other tabs...
/// }
/// ```
struct MessagesView: View {
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    var body: some View {
        List {
            ForEach(1...5, id: \.self) { index in
                Button("Conversation \(index)") {
                    // Navigate to a specific conversation
                    // This would typically use a more specific route
                    coordinator.navigate(to: .detail(itemId: index))
                }
            }
        }
        .navigationTitle("Messages")
    }
}
