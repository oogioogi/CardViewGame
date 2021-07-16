//
//  ContentView.swift
//  CardViewGame
//
//  Created by 이용석 on 2021/07/10.
// [ View ]

import SwiftUI

struct EmojiMemoryGameView: View{
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        
//        ScrollView {
//            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
//                ForEach(game.cards, id: \.self.id) { card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3 ,content: { card in
            CardView(card: card)
                .padding(4)
            
                .onTapGesture {
                    game.choose(card)
                }
        } )

//                }
//            }
//        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
}

struct CardView: View {
    
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text("\(card.content)").font(font(in: geometry.size))
                }else if card.isMatched {
                    shape.opacity(0.5)
                }else {
                    shape.fill()
                }
            }
        }
    }
    private func font(in size: CGSize ) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 25.0
        static let lineWidth: CGFloat = 3.0
        static let fontScale: CGFloat = 0.8
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
