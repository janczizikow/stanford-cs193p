//
//  Card.swift
//  Concentration
//
//  Created by Jan Cziżikow on 10/27/19.
//  Copyright © 2019 Jan Cziżikow. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
