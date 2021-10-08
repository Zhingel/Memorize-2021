//
//  MemoryGame.swift
//  Memorize 2021
//
//  Created by Стас Жингель on 07.10.2021.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    mutating func choose(_ card: Card) {
        let choosenIndex = index(of: card)
        cards[choosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
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
