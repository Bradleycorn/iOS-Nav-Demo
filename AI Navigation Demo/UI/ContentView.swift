import SwiftUI

/// A view that displays the content for each tab.
struct ContentView: View {
    /// The current tab being displayed.
    let tab: AppRoute.TabItem
    
    var body: some View {
        switch tab {
        case .feed:
            FeedView()
        case .messages:
            MessagesView()
        case .notifications:
            NotificationsView()
        }
    }
}
