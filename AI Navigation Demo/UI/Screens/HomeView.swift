import SwiftUI

/// A view representing the home screen of the application.
///
/// This view serves as the landing page for the app, typically displaying
/// a summary or overview of the app's main content.
///
/// Usage:
/// This view is usually the root view of the feed tab in the main tab view.
///
/// Example:
/// ```swift
/// NavigationStack {
///     HomeView()
/// }
/// ```
struct HomeView: View {
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to the Home View")
                .font(.largeTitle)
            
            Button("Go to Profile") {
                coordinator.navigate(to: .profile(userId: "123"))
            }
            
            Button("View Item Details") {
                coordinator.navigate(to: .detail(itemId: 456))
            }
        }
        .navigationTitle("Home")
    }
}

