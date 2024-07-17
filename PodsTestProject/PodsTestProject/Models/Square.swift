//
//  PodsList.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

struct Square: Decodable {
    let name: String?
    let owner: Owner
    let description: String?
}

struct Owner: Decodable {
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}
