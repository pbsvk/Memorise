//
//  CardView.swift
//  Practice
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 11/4/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 8)
            Group {
                base
                    .fill(.white)
                
                base
                    .strokeBorder(lineWidth: 8)
               
                Pie(endAngle: .degrees(260))
                    .opacity(0.5)
                
                    .overlay(
                        Text(card.content)
                            .font(.system(size: 50))
                            .minimumScaleFactor(0.01)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(3)
                    )
                    .padding(5)
                    
            }
            .padding(5)
            .opacity(card.isFaceUp ? 1:0)
            base
                .fill()
                .opacity(card.isFaceUp ? 0:1)
                .foregroundColor(.purple)
        }
        .frame(width: 80, height:100)
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
    }
}
struct CardView_Previews : PreviewProvider {
    typealias Card = MemoryGame<String>.Card
    static var previews: some View {
        CardView(Card(content: "X", id: "test1"))
            .padding()
            .foregroundColor(.green)
    }
}
