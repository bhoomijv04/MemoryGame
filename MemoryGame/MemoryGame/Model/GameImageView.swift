//
//  GameImageViewData.swift
//  MemoryGame
//
//  Created by Bhoomi Vadgama on 23/06/24.
//

import Foundation

// MARK: Data Model

typealias GameImageViewResponse = [GameImageViewData]

public struct GameImageViewData: Decodable {
    
    public let name: String
    public let url: String
    
    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
