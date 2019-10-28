//
//  Concentration.swift
//  Concentration
//
//  Created by Jan Cziżikow on 10/27/19.
//  Copyright © 2019 Jan Cziżikow. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfFaceUpCard: Int? = nil

    func chooseCard(at index: Int) {
        cards[index].isFaceUp = !cards[index].isFaceUp
        if !cards[index].isMatched {
            if let matchIndex = indexOfFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
