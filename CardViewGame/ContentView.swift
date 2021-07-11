//
//  ContentView.swift
//  CardViewGame
//
//  Created by 이용석 on 2021/07/10.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards, id: \.self.id) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode:.fit)
                    }
                }
            }.foregroundColor(.red)

        }
        .padding(.horizontal)
        
        
    }

}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
        
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 25.0)
        ZStack{
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text("\(card.content)").font(.largeTitle)
            }else {
                shape.fill()
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
