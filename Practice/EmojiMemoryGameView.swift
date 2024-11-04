import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
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
            
            Text(viewModel.theme.name)
                .font(.headline)
                .foregroundColor(viewModel.theme.color)
            
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards )
            }
            HStack {
                Button(action: {
                    viewModel.newGame()
                    let impactFeedback = UIImpactFeedbackGenerator(style: .heavy)
                                impactFeedback.impactOccurred()
                }, label: {
                    VStack(spacing: 5) {
                        Image(systemName: "plus.circle.fill").font(.largeTitle)
                        Text("New Game")
                    }
                })
                
                Spacer()
                
                Text("Score: \(viewModel.score)")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Spacer()
                
                Button(action: {
                    viewModel.shuffle()
                    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                impactFeedback.impactOccurred()
                }, label: {
                    VStack(spacing: 5) {
                        Image(systemName: "shuffle.circle.fill").font(.largeTitle)
                        Text("Shuffle")
                    }
                })
            }
            .foregroundColor(viewModel.theme.color)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.theme.color)
    }
}
#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
