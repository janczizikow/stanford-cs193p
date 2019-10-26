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
    var flipCount = 0 {
        didSet  {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    let emojis = ["👻", "🎃", "🎃", "👻"]
    
    // MARK: Outlets
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.firstIndex(of: sender)
        
        if cardNumber != nil {
            if cardNumber! < emojis.count {
                let emoji = emojis[cardNumber!]
                flipCard(withEmoji: emoji, on: sender)
            }
        }
    }
    
    // MARK: Private methods
    private func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

