//
//  PodsManagerProtocol.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

protocol PodsManagerProtocol {
    func getPodsList() async throws -> [Square]
}
