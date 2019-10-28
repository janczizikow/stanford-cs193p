//
//  ViewController.swift
//  Concentration
//
//  Created by Jan Cziżikow on 10/26/19.
//  Copyright © 2019 Jan Cziżikow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    var flipCount = 0 { didSet  { flipCountLabel.text = "Flips: \(flipCount)" } }
    var emoji = [Int: String]() // Dictionary<Int, String>
    var emojiChoices = ["🦇", "😱", "🙀", "👻", "🎃", "🍭 ", "🍬", "🍎"]
    
    // MARK: Outlets
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var newGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    @IBAction func touchNewGameButton(_ sender: UIButton) {
        // Reset State
        flipCount = 0
        emoji = [Int: String]()
        emojiChoices = ["🦇", "😱", "🙀", "👻", "🎃", "🍭 ", "🍬", "🍎"]
        game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
        
        // Reset UI
        for button in cardButtons {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            button.isEnabled = true
        }
        newGameButton.isHidden = true
    }
    
    // MARK: Private methods
    private func updateViewFromModel() {
        var allCardsMatched = true
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.isEnabled = !card.isMatched
                
                if (!card.isMatched) {
                    allCardsMatched = false
                }
            }
        }
        
        if (allCardsMatched) {
            newGameButton.isHidden = false
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
//            let randomIndex = Int(    (UInt32(emojiChoices.count())))
            let randomIndex = Int.random(in: 0..<emojiChoices.endIndex)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        // Shorthand for the code above
        return emoji[card.identifier] ?? "?"
    }
}

