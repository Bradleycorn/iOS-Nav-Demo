import SwiftUI

/// A view for displaying and modifying app settings.
///
/// This view allows users to configure various options and preferences
/// for the application.
///
/// Usage:
/// This view is typically accessed from a settings button in the app's main interface
/// or from a user's profile.
///
/// Example:
/// ```swift
/// coordinator.navigate(to: .settings)
/// ```
struct SettingsView: View {
    /// The navigation coordinator, injected as an environment object.
    @EnvironmentObject private var coordinator: NavigationCoordinator
    
    var body: some View {
        Form {
            Section(header: Text("Account")) {
                Text("Account settings would go here")
            }
            
            Section(header: Text("Preferences")) {
                Text("App preferences would go here")
            }
            
            Section {
                Button("Go Home") {
                    coordinator.navigateToRoot()
                }
            }
        }
        .navigationTitle("Settings")
    }
}
