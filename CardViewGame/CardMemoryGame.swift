//
//  CardMemoryGame.swift
//  CardViewGame
//
//  Created by 이용석 on 2021/07/11.
// [ View Model ]

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾",
                  "🏐","🏉","🥏","🎱","🪀","🏓",
                  "🏸","🏒","🏑","🥍","🏏","🥅",
                  "⛳️","🪁","🏹","🎣","🤿","🥊"]
    //private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsCards: 4, creatCardContent: makeCardContent)
    
    static func creatMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsCards: 3) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
            
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.creatMemoryGame()
        
    //var objectWillChange: ObservableObjectPublisher
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    } 
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card: card)
    }
}
