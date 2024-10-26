//
//  MemoryGame.swift
//  Practice
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 10/20/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    init (numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //Add numberOfPairsOfCards x 2
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: "a\(pairIndex+1)", content: content))
            cards.append(Card(id: "b\(pairIndex+1)", content: content))
            
        }
    }

    var indexofOneAndOnlyFaceUpCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
        }
        set{
            for index in cards.indices {
                if index == newValue {
                    cards[index].isFaceUp = true
                }
                else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].ismatched   {
                if let potentialMatchIndex = indexofOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].ismatched = true
                        cards[potentialMatchIndex].ismatched = true
                    }
                }
                else
                {
                    indexofOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
  
    
    mutating func shuffle() {
        cards.shuffle()
   }
   
    
    
    struct Card: Equatable, Identifiable {
        var id: String
        var isFaceUp: Bool = false
        var ismatched: Bool = false
        let content: CardContent
    }
}
