//
//  CardMemoryGame.swift
//  CardViewGame
//
//  Created by 이용석 on 2021/07/11.
// [ View Model ]

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
     private static let emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾",
                  "🏐","🏉","🥏","🎱","🪀","🏓",
                  "🏸","🏒","🏑","🥍","🏏","🥅",
                  "⛳️","🪁","🏹","🎣","🤿","🥊"]
    //private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsCards: 4, creatCardContent: makeCardContent)
    
    private static func creatMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsCards: 10) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
            
        }
    }
    
    @Published private var model = EmojiMemoryGame.creatMemoryGame()
        
    //var objectWillChange: ObservableObjectPublisher
    var cards: Array<Card> {
        return model.cards
    } 
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        //objectWillChange.send()
        model.choose(card)
    }
}
