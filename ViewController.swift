//
//  ViewController.swift
//  Games
//
//  Created by period2 on 4/5/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets and Variables
    
    @IBOutlet var upLeft: UITapGestureRecognizer!
    @IBOutlet var upMid: UITapGestureRecognizer!
    @IBOutlet var upRight: UITapGestureRecognizer!
    @IBOutlet var midLeft: UITapGestureRecognizer!
    @IBOutlet var midMid: UITapGestureRecognizer!
    @IBOutlet var botLeft: UITapGestureRecognizer!
    @IBOutlet var midRight: UITapGestureRecognizer!
    @IBOutlet var botMid: UITapGestureRecognizer!
    @IBOutlet var botRight: UITapGestureRecognizer!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var xScoreLabel: UILabel!
    @IBOutlet weak var oScoreLabel: UILabel!
    @IBOutlet weak var xScore: UILabel!
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var nextGameButton: UIButton!
    var xscore = 0
    var oscore = 0
    var games = 0
    
    // MARK: ViewDidLoad
    
    override func viewDidLoad() {
        labelOne.layer.borderWidth = 0
        labelTwo.layer.borderWidth = 0
        labelThree.layer.borderWidth = 0
        labelFour.layer.borderWidth = 0
        labelFive.layer.borderWidth = 0
        labelSix.layer.borderWidth = 0
        labelSeven.layer.borderWidth = 0
        labelEight.layer.borderWidth = 0
        labelNine.layer.borderWidth = 0
        turnLabel.layer.borderWidth = 0
        resetButton.layer.borderWidth = 0
        labelOne.text = nil
        labelTwo.text = nil
        labelThree.text = nil
        labelFour.text = nil
        labelFive.text = nil
        labelSix.text = nil
        labelSeven.text = nil
        labelEight.text = nil
        labelNine.text = nil
        turnLabel.text = "X"
        nextGameButton.isHidden = true
        winnerLabel.isHidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Change Turn
    
    func changeTurn() {
        if turnLabel.text == "X" {
            turnLabel.text = "O"
        } else {
            turnLabel.text = "X"
        }
    }
    
    // MARK: Reset
    
    func reset() {
        labelOne.text = nil
        labelTwo.text = nil
        labelThree.text = nil
        labelFour.text = nil
        labelFive.text = nil
        labelSix.text = nil
        labelSeven.text = nil
        labelEight.text = nil
        labelNine.text = nil
        turnLabel.text = "X"
        upLeft.numberOfTapsRequired = 1
        upMid.numberOfTapsRequired = 1
        upRight.numberOfTapsRequired = 1
        midLeft.numberOfTapsRequired = 1
        midMid.numberOfTapsRequired = 1
        midRight.numberOfTapsRequired = 1
        botLeft.numberOfTapsRequired = 1
        botMid.numberOfTapsRequired = 1
        botRight.numberOfTapsRequired = 1
    }
    
    // MARK: XWin
    
    func xWin() {
        xscore += 1
        xScore.text = String(xscore)
    }
    
    // MARK: OWin
    
    func oWin() {
        oscore += 1
        oScore.text = String(oscore)
    }
    
    // MARK: Stop
    
    func stop() {
        upLeft.numberOfTapsRequired = 999
        upMid.numberOfTapsRequired = 999
        upRight.numberOfTapsRequired = 999
        midLeft.numberOfTapsRequired = 999
        midMid.numberOfTapsRequired = 999
        midRight.numberOfTapsRequired = 999
        botLeft.numberOfTapsRequired = 999
        botMid.numberOfTapsRequired = 999
        botRight.numberOfTapsRequired = 999
    }
    
    // MARK: Check For Winner
    
    func checkForWinner() {

        if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text  && labelOne.text != nil {
            if labelOne.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"
            } else if labelOne.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
            stop()
        } else if labelFour.text == labelFive.text && labelFive.text == labelSix.text  && labelFour.text != nil {
            if labelFour.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"

            } else if labelFour.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
        } else if labelSeven.text == labelEight.text && labelEight.text == labelNine.text  && labelSeven.text != nil {
            if labelSeven.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"

            } else if labelSeven.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
            stop()
        } else if labelOne.text == labelFour.text && labelFour.text == labelSeven.text  && labelOne.text != nil {
            if labelOne.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"

            } else if labelOne.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
            stop()
        } else if labelTwo.text == labelFive.text && labelFive.text == labelEight.text  && labelTwo.text != nil {
            if labelTwo.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"

            } else if labelTwo.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
            stop()
        } else if labelThree.text == labelSix.text && labelSix.text == labelNine.text  && labelThree.text != nil {
            if labelThree.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"
            } else if labelThree.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
            stop()
        } else if labelOne.text == labelFive.text && labelFive.text == labelNine.text  && labelOne.text != nil {
            if labelOne.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"
            } else if labelOne.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
            stop()
        } else if labelThree.text == labelFive.text && labelFive.text == labelSeven.text  && labelThree.text != nil {
            if labelThree.text == "X" {
                xWin()
                winnerLabel.text = "X Wins"

            } else if labelThree.text == "O" {
                oWin()
                winnerLabel.text = "O Wins"
            }
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
            stop()
        }

    }
    
    // MARK: Check For Draw
    
    func checkForDraw() {
        if labelOne.text != nil && labelTwo.text != nil && labelThree.text != nil && labelFour.text != nil && labelFive.text != nil && labelSix.text != nil && labelSeven.text != nil && labelEight.text != nil && labelNine.text != nil {
            winnerLabel.text = "Draw"
            nextGameButton.isHidden = false
            winnerLabel.isHidden = false
        }
    }
    
    // MARK: Tap Gestures
    
    @IBAction func upLeft(_ sender: Any) {
        if labelOne.text != nil {
        } else {
            labelOne.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func upMid(_ sender: Any) {
        if labelTwo.text != nil {
        } else {
            labelTwo.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func upRight(_ sender: Any) {
        if labelThree.text != nil {
        } else {
            labelThree.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func midLeft(_ sender: Any) {
        if labelFour.text != nil {
        } else {
            labelFour.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func midMid(_ sender: Any) {
        if labelFive.text != nil {
        } else {
            labelFive.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func midRight(_ sender: Any) {
        if labelSix.text != nil {
        } else {
            labelSix.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func botLeft(_ sender: Any) {
        if labelSeven.text != nil {
        } else {
            labelSeven.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func botMid(_ sender: Any) {
        if labelEight.text != nil {
        } else {
            labelEight.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    @IBAction func botRight(_ sender: Any) {
        if labelNine.text != nil {
        } else {
            labelNine.text = turnLabel.text
            changeTurn()
        }
        checkForWinner()
        checkForDraw()
    }
    
    // MARK: Reset Button
    
    @IBAction func resetButton(_ sender: Any) {
        func resetAlert() {
            let reset = UIAlertController(title: "Reset The Game Or The Score?", message: "", preferredStyle: .alert)
            let game = UIAlertAction(title: "Game", style: .default) { (action) in
                self.reset()
            }
            let yes = UIAlertAction(title: "Score", style: .default) { (action) in
                self.reset()
                self.xScore.text = "0"
                self.oScore.text = "0"
                self.xscore = 0
                self.oscore = 0
            }
            let no = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            reset.addAction(game)
            reset.addAction(yes)
            reset.addAction(no)
            present(reset, animated: true, completion: nil)
        }
        resetAlert()
    }
    
    // MARK: Next Game Button
    
    @IBAction func nextGameButton(_ sender: Any) {
        reset()
        nextGameButton.isHidden = true
        winnerLabel.isHidden = true
        winnerLabel.text = ""
        games += 1
        if games % 2 == 0 {
            turnLabel.text = "X"
        } else {
            turnLabel.text = "O"
        }
    }
}
