//
//  NetworkServiceTests.swift
//  NetworkServiceTests
//
//  Created by Анжелика on 10.07.24.
//

import XCTest
@testable import PodsTestProject

// MARK: - Mock service

class MockHTTPClient: HTTPClient {
    func sendRequest<T>(endpoint: Endpoint, responseModel: T.Type) async throws -> T where T : Decodable {
        return [Square]() as! T
    }
}

final class NetworkServiceTests: XCTestCase {

    var networkService: NetworkService!

    override func setUpWithError() throws {
        networkService = NetworkService()
    }

    override func tearDownWithError() throws {
        networkService = nil
    }

    func testGetPodsListSuccess() async throws {
        do {
            let pods = try await networkService.getPodsList(offset: 0, limit: 10)
            XCTAssertNotNil(pods)
            XCTAssertEqual(pods.count, 30)
        } catch {
            XCTFail("Expected successful response, but got \(error) instead")
        }
    }
}
