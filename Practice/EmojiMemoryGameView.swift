import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack { 
            titleView
            
            Text(viewModel.theme.name)
                .font(.headline)
                .foregroundColor(viewModel.theme.color)
            
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            
            controlsView
        }
        .padding()
    }
    
    // Add this computed property
    private var titleView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50, style: .continuous)
                .frame(width: 230, height: 70)
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
    }
    //Re installed XCode
    // Add this computed property
    private var controlsView: some View {
        HStack {
            newGameButton
            
            Spacer()
            
            scoreView
            
            Spacer()
            
            shuffleButton
        }
        .foregroundColor(viewModel.theme.color)
    }
    
    // Add this computed property
    private var newGameButton: some View {
        Button(action: {
            viewModel.newGame()
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }) {
            VStack(spacing: 5) {
                Image(systemName: "plus.circle.fill").font(.largeTitle)
                Text("New Game")
            }
        }
    }
    
    // Add this computed property
    private var scoreView: some View {
        Text("Score: \(viewModel.score)")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)
    }
    
    // Add this computed property
    private var shuffleButton: some View {
        Button(action: {
            viewModel.shuffle()
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }) {
            VStack(spacing: 5) {
                Image(systemName: "shuffle.circle.fill").font(.largeTitle)
                Text("Shuffle")
            }
        }
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
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

// End of file. No additional code.
