//
//  PodsNetworkService.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

struct NetworkService: HTTPClient, NetworkServiciable {
    
    func getPodsList(offset: Int, limit: Int) async throws -> [Square] {
        try await sendRequest(endpoint: PodsEndpoint.podsList(offset: 0,limit: limit),
                          responseModel: [Square].self)
    }
}
