//
//  PodsManager.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

final class PodsManager {
    var networkManager = NetworkService()
}

extension PodsManager: PodsManagerProtocol {
    
    func getPodsList() async throws -> [Square] {
        return try await getArrayFromNetwork(offset: 0, limit: 10)
    }
}

// MARK: - Private methods

private extension PodsManager {
    func getArrayFromNetwork(offset: Int, limit: Int) async throws -> [Square] {
        do {
            let pods = try await networkManager.getPodsList(offset: 0, limit: limit)
            
            return pods
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
