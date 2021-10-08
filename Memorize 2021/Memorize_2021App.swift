//
//  Memorize_2021App.swift
//  Memorize 2021
//
//  Created by Стас Жингель on 06.10.2021.
//

import SwiftUI

@main
struct Memorize_2021App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
