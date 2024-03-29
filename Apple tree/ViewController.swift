//
//  ViewController.swift
//  Apple tree
//
//  Created by Steve on 3/27/24.
//

import UIKit
var listOfWords = ["cole", "spencer", "jacob", "mike", "aaron", "acuna", "shohei", "bryce", "zac"]
let incorrectMovesAllowed = 7

var totalWins = 0
var totalLosses = 0

class ViewController: UIViewController {

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
    }
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var socreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var treeImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    var currentGame: Game!
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }

    func updateUI() {
        socreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

}

