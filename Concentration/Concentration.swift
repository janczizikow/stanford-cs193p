//
//  Concentration.swift
//  Concentration
//
//  Created by Jan Cziżikow on 10/27/19.
//  Copyright © 2019 Jan Cziżikow. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    private var indexOfFaceUpCard: Int? {
        get {
            var faceUpCardIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if faceUpCardIndex == nil {
                        faceUpCardIndex = index
                    } else {
                        return nil
                    }
                }
            }
            
            return faceUpCardIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): index is out ouf bounds")
        if !cards[index].isMatched {
            if let matchIndex = indexOfFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cards are face up
                indexOfFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): numberOfPairsOfCards should be greater than 0")
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}
