//
//  PodsEndpoint.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import Foundation

enum PodsEndpoint {
    case podsList(offset: Int, limit: Int)
}

extension PodsEndpoint: Endpoint {
    var host: String {
        switch self {
        case .podsList:
            return "api.github.com"
        }
    }
    
    var path: String {
        switch self {
        case .podsList(let offset, let limit):
            return "/orgs/square/repos?offset=\(0)&limit=\(limit)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .podsList:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .podsList:
            return nil
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .podsList:
            return nil
        }
    }
}
