//
//  Card.swift
//  Concentration
//
//  Created by Jan Cziżikow on 10/27/19.
//  Copyright © 2019 Jan Cziżikow. All rights reserved.
//

import Foundation

struct Card: Hashable {
//    Depracated:
//    var hashValue: Int { return identifier }
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
