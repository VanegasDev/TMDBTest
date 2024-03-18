//
//  Session.swift
//  TMDBTest
//
//  Created by Mario Vanegas on 15/3/24.
//

import Foundation

struct SessionToken: Storable {
    let success: Bool
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "guest_session_id"
    }
}
