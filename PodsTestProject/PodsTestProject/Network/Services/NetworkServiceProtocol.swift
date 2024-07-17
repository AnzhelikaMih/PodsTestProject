//
//  NetworkServiceProtocol.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

protocol NetworkServiciable {
    func getPodsList(offset: Int, limit: Int) async throws -> [Square]
}
