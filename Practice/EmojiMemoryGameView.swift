import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject  var viewModel: EmojiMemoryGame
    @State var selectedTab: Int = 0
    let emojis:[String] = ["🚴", "🥊", "⚽️", "🎾", "🏊", "🏄‍♂️", "🤽‍♀️", "🤼‍♂️", "🤺", "🏎️", "🥋", "🏌️‍♂️"]
    let emojis_2:[String] = ["⚰️","🪄","🔮","🧿","🦄","🍭","🧙","🧌"]
    let emojis_3:[String] = ["🤣", "🥺", "😇", "😅", "😫", "😏", "🥶", "🥵", "😡", "🤯", "🤗", "😭",
                             "😎", "🤓"]
    @State private var emojis_cur:[String] = ["🚴", "🥊", "⚽️", "🎾", "🏊", "🏄‍♂️", "🤽‍♀️", "🤼‍♂️", "🤺", "🏎️", "🥋", "🏌️‍♂️"]
    @State var cardCount = 10
    var body: some View {
        GeometryReader {
           
            geometry in
            
            VStack
            {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 50, style: .continuous)
                        .frame(width:230 , height: 70, alignment: .topLeading)
                    Text("Memorize")
                        .font(.largeTitle)
                        .foregroundStyle(
                            AngularGradient(
                                gradient: Gradient(colors: [.blue, .red, .orange, .yellow, .green]),
                                center: .center
                            )
                        )
                        .fontWeight(.heavy)
                    
                    
                }
                NavigationStack {
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum: 100), spacing: 0)
                        ], spacing: 0) {
                            ForEach(viewModel.cards) { cards in
                                CardView(cards)
                                
                                    .aspectRatio(2/3, contentMode: .fit)
                                    .padding(5)
                                    .animation(.default, value: viewModel.cards)
                                    .onTapGesture {
                                        viewModel.choose(cards)
                                    }
                            }
                        }
                    }
                }
                 
                HStack {
                    Spacer()
                    
                    Button(action: {
                        viewModel.shuffle()  // Switch to FirstView
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.impactOccurred() // Trigger the haptic feedback
                    }) {
                        VStack {
                            Image(systemName:"soccerball")
                                .font(.title)
                            Text("New Game")
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()
                    
                }.padding()
                
            }
            
        }
        
    }
    
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        @State var base = RoundedRectangle(cornerRadius: 12)
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        var body: some View {
            ZStack {
                Group {
                    base
                        .fill(.white)
                    
                    base
                        .strokeBorder(lineWidth: 8)
                        .foregroundColor(.purple)
                    
                    Text(card.content)
                        .font(.system(size: 50))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1:0)
                base
                    .fill()
                    .opacity(card.isFaceUp ? 0:1)
                    .foregroundColor(.purple)
            }
            .frame(width: 80, height:100)
            .opacity(card.isFaceUp || !card.ismatched ? 1:0)
        }
    }
    struct ThemeView: View {
        
        let themeImage: String
        let themeName: String
        
        var body: some View {
            VStack {
                Image(systemName: themeImage)
                    .font(.system(size: 24))
                    .foregroundColor(.accentColor)
                
                Text(themeName)
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(.blue)
            }
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
