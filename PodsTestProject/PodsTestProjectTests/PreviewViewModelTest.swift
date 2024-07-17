//
//  VMTest.swift
//  PodsTestProjectTests
//
//  Created by Анжелика on 11.07.24.
//

import XCTest
@testable import PodsTestProject

// Mock для PodsManagerProtocol
class MockPodsManager: PodsManagerProtocol {
    var shouldThrowError = false
    var pods: [Square] = []
    
    func getPodsList() async throws -> [Square] {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return pods
    }
}

// Mock для PreviewFlowCoordinatorOutput
class MockPreviewFlowCoordinatorOutput: PreviewFlowCoordinatorOutput {
    var finishFlow: CompletionBlock?
    var triggeredRoutes: [PreviewFlowRoute] = []
    
    func trigger(_ route: PreviewFlowRoute) {
        triggeredRoutes.append(route)
    }
}

final class PreviewViewModelTests: XCTestCase {
    
    var viewModel: PreviewViewModel!
    var mockPodsManager: MockPodsManager!
    var mockRouter: MockPreviewFlowCoordinatorOutput!
    
    override func setUpWithError() throws {
        mockPodsManager = MockPodsManager()
        mockRouter = MockPreviewFlowCoordinatorOutput()
        viewModel = PreviewViewModel(podsService: mockPodsManager, router: mockRouter)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockPodsManager = nil
        mockRouter = nil
    }
    
    func testFetchData_Failure() async throws {
        // Given
        mockPodsManager.shouldThrowError = true
        
        let expectation = XCTestExpectation(description: "Fetch pods data failure")
        
        // When
        viewModel.fetchData()
        
        // Then
        XCTAssertEqual(mockRouter.triggeredRoutes.count, 0)
        expectation.fulfill()
        
        wait(for: [expectation])
    }
}
