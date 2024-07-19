import SwiftUI

/// A view displaying a user's profile information.
///
/// This view shows details about a specific user, identified by their user ID.
/// It typically includes personal information and user-specific content.
///
/// - Parameter userId: The unique identifier of the user whose profile is being displayed.
///
/// Usage:
/// This view is navigated to when selecting a user or accessing one's own profile.
///
/// Example:
/// ```swift
/// coordinator.navigate(to: .profile(userId: "user123"))
/// ```
struct ProfileView: View {
    /// The unique identifier of the user.
    let userId: String
    
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Profile for User: \(userId)")
                .font(.title)
            
            Text("User details would go here")
                .foregroundColor(.secondary)
            
            Button("Go to Settings") {
                coordinator.navigate(to: .settings)
            }
        }
        .navigationTitle("Profile")
    }
}

