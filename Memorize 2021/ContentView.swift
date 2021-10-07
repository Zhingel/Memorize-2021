//
//  ContentView.swift
//  Memorize 2021
//
//  Created by Стас Жингель on 06.10.2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚀","🛸","🚂","🚐","🚒","🛻","🛴","🚲","🛵","🏍","🚘","🚠","🚄","🚆","🛶","⛵️","🚁"]
    @State var emojisCount = 12
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojisCount], id:\.self) { emoji in
                        CardView(content: emoji)
                                    .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Text("Shuffle")
                add
            }
            .font(.title)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    var remove: some View {
        Button(action: {
            if emojisCount > 1 {
                emojisCount -= 1
            }
        }) {
            Image(systemName: "minus.circle.fill")
        }
    }
    var add: some View {
        Button( action: {
            if emojisCount < emojis.count {
                emojisCount += 1
            }
        }) {
            Image(systemName: "plus.circle.fill")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
