import SwiftUI

struct ContentView: View {
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
                            GridItem(.flexible(minimum: 64)),
                            GridItem(.flexible(minimum: 64)),
                            GridItem(.flexible(minimum: 64)),
                            GridItem(.flexible(minimum: 64))
                        ]) {
                            ForEach(emojis_cur[0..<emojis_cur.count], id: \.self) { emoji in
                                CardView(content: emoji)
                                    .aspectRatio(2/3, contentMode: .fit)
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()

                    Button(action: {
                        emojis_cur = emojis.shuffled()  // Switch to FirstView
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.impactOccurred() // Trigger the haptic feedback
                    }) {
                        VStack {
                            Image(systemName:"soccerball")
                                .font(.title)
                            
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    
                    Spacer()
                    Button(action: {
                        emojis_cur = emojis_2.shuffled()  // Switch to second View
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.impactOccurred() // Trigger the haptic feedback
                    }) {
                        VStack {
                            Image(systemName:"wand.and.rays")
                                .font(.title)
                            
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()
                    Button(action: {
                        emojis_cur = emojis_3.shuffled()  // Switch to second View
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.impactOccurred() // Trigger the haptic feedback
                    }) {
                        VStack {
                            Image(systemName:"face.smiling")
                                .font(.title)
                            
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Spacer()

                }.padding()
                
            }
            
        }
        
    }
    
}
   struct CardView: View {
        let content: String
        @State var isFaceUp = true
       @State var base = RoundedRectangle(cornerRadius: 12)
        
        var body: some View {
            ZStack {
                Group {
                    base
                        .fill(.white)
                    
                    base
                        .strokeBorder(lineWidth: 8)
                        .foregroundColor(.purple)
                    
                    Text(content)
                        .font(.largeTitle)
                    
                }
                .opacity(isFaceUp ? 1:0)
                base
                    .fill()
                    .opacity(isFaceUp ? 0:1)
                    .foregroundColor(.purple)
            }
            .frame(width: 80, height:100)
            .animation(.easeInOut, value: isFaceUp)
            .onTapGesture {
                isFaceUp.toggle()
                
            }
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
