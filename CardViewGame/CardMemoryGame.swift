//
//  CardMemoryGame.swift
//  CardViewGame
//
//  Created by 이용석 on 2021/07/11.
//

import SwiftUI

//func makeCardContent(index: Int) -> String {
//    return "😄"
//}

class EmojiMemoryGame {
    
    static let emojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾",
                  "🏐","🏉","🥏","🎱","🪀","🏓",
                  "🏸","🏒","🏑","🥍","🏏","🥅",
                  "⛳️","🪁","🏹","🎣","🤿","🥊"]
    //private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsCards: 4, creatCardContent: makeCardContent)
    
    static func creatMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
            
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.creatMemoryGame()
        

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
