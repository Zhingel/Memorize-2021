//
//  MemoryGame.swift
//  Memorize 2021
//
//  Created by Стас Жингель on 07.10.2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(_ card: Card) {
        
    } 
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1 , content: content))
        }
    }
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
