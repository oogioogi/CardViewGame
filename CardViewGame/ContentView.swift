//
//  ContentView.swift
//  CardViewGame
//
//  Created by 이용석 on 2021/07/10.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾",
                  "🏐","🏉","🥏","🎱","🪀","🏓",
                  "🏸","🏒","🏑","🥍","🏏","🥅",
                  "⛳️","🪁","🏹","🎣","🤿","🥊"]
    
    @State var emojisCount = 1
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                        CardView(content: emoji)
                    }
                }
            }.foregroundColor(.red)
            
            Spacer()
            
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
            
        }
        .padding(.horizontal)
        
        
    }
    
    var remove: some View {
        Button("\(Image(systemName: "minus.circle"))") {
            if emojisCount > 1 {
                emojisCount -= 1
            }
        }
    }
    
    var add: some View {
        Button("\(Image(systemName: "plus.circle"))") {
            if emojisCount < emojis.count {
                emojisCount += 1
            }
        }
    }
}

struct CardView: View {
    
    var content: String
    @State var isfaceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 25.0)
        ZStack{
            if isfaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text("\(content)").font(.largeTitle)
            }else {
                shape.fill()
            }

        }
        .onTapGesture(perform: {
            isfaceUp = !isfaceUp
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
