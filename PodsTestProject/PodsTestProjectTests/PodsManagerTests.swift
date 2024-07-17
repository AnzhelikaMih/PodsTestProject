//
//  PodsManagerTest.swift
//  PodsTestProjectTests
//
//  Created by Анжелика on 11.07.24.
//

import XCTest
@testable import PodsTestProject

// Mock NetworkService for testing purposes
class MockNetworkService {
    func getPodsList(offset: Int, limit: Int) async throws -> [Square] {
        // Mock implementation to return predefined data
        return [
            Square(name: "Pod1", owner: Owner(avatarUrl: "https://example.com/avatar1.png"), description: "Description1"),
            Square(name: "Pod2", owner: Owner(avatarUrl: "https://example.com/avatar2.png"), description: "Description2")
        ]
    }
}

class PodsManagerTests: XCTestCase {
    var podsManager: PodsManager!
    var mockNetworkService: MockNetworkService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockNetworkService = MockNetworkService()
        podsManager = PodsManager()
    }
    
    override func tearDownWithError() throws {
        podsManager = nil
        mockNetworkService = nil
        try super.tearDownWithError()
    }
    
    func testGetPodsList_Success() async throws {
        // Given
        var receivedPods: [Square]?
        var receivedError: Error?
        
        // When
        do {
            receivedPods = try await mockNetworkService.getPodsList(offset: 0, limit: 10)
        } catch {
            receivedError = error
        }
        
        // Then
        XCTAssertNil(receivedError)
        XCTAssertEqual(receivedPods?.count, 2)
        XCTAssertEqual(receivedPods?[0].name, "Pod1")
        XCTAssertEqual(receivedPods?[1].name, "Pod2")
    }
}
