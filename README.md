# SwiftUI Advanced Navigation Example

This project demonstrates an advanced navigation system for large-scale SwiftUI applications. It showcases various modern iOS navigation concepts and provides a robust, scalable architecture for complex app navigation.

## Overview

This navigation system implements the following key concepts:

1. **Centralized Navigation Management**: Using a `NavigationCoordinator` to manage all navigation state and logic.
2. **Nested Navigation**: Supporting multiple levels of navigation within a tab-based structure.
3. **Multiple Back Stacks**: Maintaining separate navigation histories for each tab.
4. **Deep Linking**: Handling external URLs to navigate directly to specific parts of the app.
5. **Tab-based Navigation**: Implementing a tab bar interface with independent navigation for each tab.
6. **Type-safe Routing**: Using an enum-based approach for defining and navigating to routes.

## Components

### AppRoute

An enum that defines all possible navigation destinations in the app. It includes cases for different screens and a nested enum for tab items.

### NavigationCoordinator

A class that manages the navigation state and logic for the entire app. It handles:
- Navigating to specific routes
- Managing separate navigation stacks for each tab
- Handling back navigation and navigation to root
- Processing deep links

### RootView

The top-level view of the app that sets up the `NavigationCoordinator` and injects it into the environment.

### MainTabView

Implements the main tab-based structure of the app, using `TabView` and `NavigationStackView` for each tab.

### NavigationStackView

A custom view that wraps `NavigationStack` and manages the navigation stack for a single tab.

### ContentView

A switch view that displays the appropriate content for each tab.

## Key Features

### Centralized Navigation

All navigation is managed through the `NavigationCoordinator`, providing a single source of truth for the app's navigation state.

### Type-safe Routing

The `AppRoute` enum ensures that all navigation actions are type-safe and well-defined.

### Deep Linking

The `handleDeepLink(_:)` method in `NavigationCoordinator` processes incoming URLs and navigates to the appropriate part of the app.

### Nested Navigation

Each tab maintains its own navigation stack, allowing for complex, nested navigation structures.

### Multiple Back Stacks

The `tabStacks` property in `NavigationCoordinator` maintains separate navigation histories for each tab.

## Usage

To use this navigation system in your app:

1. Define your routes in the `AppRoute` enum.
2. Customize the `NavigationCoordinator` as needed for your app's navigation logic.
3. Set up your main app structure using `RootView` and `MainTabView`.
4. Create your content views and use the `coordinator.navigate(to:)` method for navigation.

## Example

```swift
struct FeedView: View {
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
