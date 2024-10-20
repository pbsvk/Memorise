//
//  PracticeApp.swift
//  Practice
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 10/12/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
