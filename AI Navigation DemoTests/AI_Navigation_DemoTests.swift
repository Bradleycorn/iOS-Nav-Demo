import XCTest
import SwiftUI
@testable import AI_Navigation_Demo

class NavigationCoordinatorTests: XCTestCase {
    var coordinator: NavigationCoordinator!
    
    override func setUp() {
        super.setUp()
        coordinator = NavigationCoordinator()
    }
    
    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(coordinator.selectedTab, .feed)
        XCTAssertEqual(coordinator.tabStacks.count, 3)
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count ?? 0, 0)
        XCTAssertEqual(coordinator.tabStacks[.messages]?.count ?? 0, 0)
        XCTAssertEqual(coordinator.tabStacks[.notifications]?.count ?? 0, 0)
    }
    
    func testNavigateToTab() {
        coordinator.navigate(to: .tabItem(.messages))
        XCTAssertEqual(coordinator.selectedTab, .messages)
    }
    
    func testNavigateToRoute() {
        coordinator.navigate(to: .profile(userId: "123"))
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 1)
    }
    
    func testNavigateBack() {
        coordinator.navigate(to: .profile(userId: "123"))
        coordinator.navigate(to: .settings)
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 2)
        
        coordinator.navigateBack()
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 1)
    }
    
    func testNavigateToRoot() {
        coordinator.navigate(to: .profile(userId: "123"))
        coordinator.navigate(to: .settings)
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 2)
        
        coordinator.navigateToRoot()
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 0)
    }
    
    func testHandleDeepLink() {
        let url = URL(string: "myapp://profile?userId=456")!
        coordinator.handleDeepLink(url)
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 1)
    }
    
    func testNavigationAcrossTabs() {
        coordinator.navigate(to: .profile(userId: "123"))
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 1)
        
        coordinator.navigate(to: .tabItem(.messages))
        XCTAssertEqual(coordinator.selectedTab, .messages)
        XCTAssertEqual(coordinator.tabStacks[.messages]?.count, 0)
        
        coordinator.navigate(to: .detail(itemId: 456))
        XCTAssertEqual(coordinator.tabStacks[.messages]?.count, 1)
        
        // Feed tab should still have its navigation stack
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 1)
    }
    
    func testInvalidDeepLink() {
        let url = URL(string: "myapp://invalidroute")!
        coordinator.handleDeepLink(url)
        XCTAssertEqual(coordinator.tabStacks[.feed]?.count, 0)
    }
}
