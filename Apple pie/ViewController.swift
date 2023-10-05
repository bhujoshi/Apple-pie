//
//  ViewController.swift
//  Apple pie
//
//  Created by Bhuwan Joshi on 03/10/23.
//

import UIKit

class ViewController: UIViewController {
    var listOfWorlds = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet{
            newRound()
        }
    }
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    var currentGame:Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    func newRound() {
        if listOfWorlds.isEmpty{
            enableLetterButton(enable: false)
        } else {
            let newWorld = listOfWorlds.removeFirst()
            currentGame = Game(word: newWorld, incorrectMovesRemaining: incorrectMovesAllowed, guessedLatters: [])
            enableLetterButton(enable: true)
            updateUi()
        }
    }
    
    func enableLetterButton(enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUi () {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        correctWordLabel.text = currentGame.formattedWord
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState () {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord.filter{!$0.isWhitespace} {
            totalWins += 1
        } else {
            updateUi()
        }
    }
    
}

