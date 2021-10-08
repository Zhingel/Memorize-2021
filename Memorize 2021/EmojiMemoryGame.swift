//
//  EmojiMemoryGame.swift
//  Memorize 2021
//
//  Created by Стас Жингель on 07.10.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["✈️","🚀","🛸","🚂","🚐","🚒","🛻","🛴","🚲","🛵","🏍","🚘","🚠","🚄","🚆","🛶","⛵️","🚁"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex]}
    }
    private(set) var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    
    //MARK: - Intents
    
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
