//
//  EmojiMemoryGame.swift
//  Practice
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 10/20/24.
//

import Foundation

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static  let emojis = ["🚴", "🥊", "⚽️", "🎾", "🏊", "🏄‍♂️", "🤽‍♀️", "🤼‍♂️", "🤺", "🏎️", "🥋", "🏌️‍♂️"]
    private static  func creatememoryGame() -> MemoryGame<String> {
        return  MemoryGame(numberOfPairsOfCards: 12){pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "?"
            }
        }
    }
    
    @Published private var model = creatememoryGame()
        
        
        
        var cards: Array<MemoryGame<String>.Card> { model.cards }
        
    //MARK: - Intents
    
     func shuffle() {
        model.shuffle()
    }
    
        func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
        }
  }

