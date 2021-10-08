//
//  ContentView.swift
//  Memorize 2021
//
//  Created by Стас Жингель on 06.10.2021.
//

import SwiftUI

struct ContentView: View {
    let viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                         CardView(card: card)
                                    .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
         //       remove
                Text("Shuffle")
           //     add
            }
            .font(.title)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
//    var remove: some View {
//        Button(action: {
//            if emojisCount > 1 {
//                emojisCount -= 1
//            }
//        }) {
//            Image(systemName: "minus.circle.fill")
//        }
//    }
//    var add: some View {
//        Button( action: {
//            if emojisCount < emojis.count {
//                emojisCount += 1
//            }
//        }) {
//            Image(systemName: "plus.circle.fill")
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }

    }
}
