//
//  Game.swift
//  Apple pie
//
//  Created by Bhuwan Joshi on 04/10/23.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLatters: [Character]
    var formattedWord: String {
        var guessedWord: [String] = []
        for letter in word {
            if guessedLatters.contains(letter){
                guessedWord.append("\(letter)")
            }else {
                guessedWord.append("_")
            }
        }
        return guessedWord.joined(separator: " ")
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLatters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1 
        }
    }
    
    
}
