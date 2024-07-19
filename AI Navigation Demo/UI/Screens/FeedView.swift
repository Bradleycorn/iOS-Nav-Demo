import SwiftUI

/// An example view for the feed tab.
struct FeedView: View {
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            Text("Feed")
            Button("Go to Profile") {
                coordinator.navigate(to: .profile(userId: "123"))
            }
            Button("Go to Settings") {
                coordinator.navigate(to: .settings)
            }
        }
    }
}
