//
//  Breakout.swift
//  Games
//
//  Created by period2 on 4/27/21.
//

import UIKit
import AVFoundation

class Breakout: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var paddle: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var brickOne: UIView!
    @IBOutlet weak var brickTwo: UIView!
    @IBOutlet weak var brickThree: UIView!
    @IBOutlet weak var brickFour: UIView!
    @IBOutlet weak var brickFive: UIView!
    @IBOutlet weak var brickSix: UIView!
    @IBOutlet weak var brickSeven: UIView!
    @IBOutlet weak var brickEight: UIView!
    @IBOutlet weak var brickNine: UIView!
    var bricks = [UIView]()
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var ballDynamicItem: UIDynamicItemBehavior!
    var paddleDynamicItem: UIDynamicItemBehavior!
    var brickDynamicBehavior: UIDynamicItemBehavior!
    var brickCount = 9
    var animatorsRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.layer.cornerRadius = 10
        bricks = [brickOne, brickTwo, brickThree, brickFour, brickFive, brickSix, brickSeven, brickEight, brickNine]
        ballView.isHidden = true
        brickOne.isHidden = true
        brickTwo.isHidden = true
        brickThree.isHidden = true
        brickFour.isHidden = true
        brickFive.isHidden = true
        brickSix.isHidden = true
        brickSeven.isHidden = true
        brickEight.isHidden = true
        brickNine.isHidden = true
        startButton.layer.borderWidth = 2
        ballView.backgroundColor = .white
        brickOne.backgroundColor = .white
        brickTwo.backgroundColor = .white
        brickThree.backgroundColor = .white
        brickFour.backgroundColor = .white
        brickFive.backgroundColor = .white
        brickSix.backgroundColor = .white
        brickSeven.backgroundColor = .white
        brickEight.backgroundColor = .white
        brickNine.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    @IBAction func movingPaddle(_ sender: UIPanGestureRecognizer) {
        paddle.center = CGPoint(x: sender.location(in: view).x, y: paddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddle)
    }
    
    func dynamicBehaviors() {
        if animatorsRunning == true {
            dynamicAnimator = UIDynamicAnimator(referenceView: view)
            pushBehavior = UIPushBehavior(items: [ballView], mode: .instantaneous)
            collisionBehavior = UICollisionBehavior(items: [ballView, paddle] + bricks)
            
            pushBehavior.active = true
            pushBehavior.setAngle(CGFloat(Int.random(in: 0 ... 180)), magnitude: 0.2)
            collisionBehavior.translatesReferenceBoundsIntoBoundary = true
            collisionBehavior.collisionMode = .everything
            collisionBehavior.collisionDelegate = self
            
            ballDynamicItem = UIDynamicItemBehavior(items: [ballView])
            ballDynamicItem.allowsRotation = true
            ballDynamicItem.elasticity = 1
            ballDynamicItem.friction = 0
            ballDynamicItem.resistance = -0.1
            
            paddleDynamicItem = UIDynamicItemBehavior(items: [paddle])
            paddleDynamicItem.density = 1000000000000
            paddleDynamicItem.allowsRotation = false
            paddleDynamicItem.elasticity = 1
            
            brickDynamicBehavior = UIDynamicItemBehavior(items: bricks)
            brickDynamicBehavior.density = 10000000000
            brickDynamicBehavior.allowsRotation = false
            brickDynamicBehavior.elasticity = 1
            
            
            
            dynamicAnimator.addBehavior(pushBehavior)
            dynamicAnimator.addBehavior(collisionBehavior)
            dynamicAnimator.addBehavior(ballDynamicItem)
            dynamicAnimator.addBehavior(paddleDynamicItem)
            dynamicAnimator.addBehavior(brickDynamicBehavior)
        } else if animatorsRunning == false {
            
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for brick in bricks {
            if item1.isEqual(ballView) && item2.isEqual(brick) {
                if brick.backgroundColor == .blue {
                    brick.isHidden = true
                    collisionBehavior.removeItem(brick)
                    brickCount -= 1
                } else {
                    brick.backgroundColor = .blue
                }
            }
        }
        if brickCount == 0 {
            alert()
            ballDynamicItem.resistance = 100000
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if ballView.center.y > paddle.center.y + 20 {
            ballDynamicItem.resistance = 100000
            alert()
        }
    }
    
    func alert() {
        let gameOver = UIAlertController(title: "GG!", message: "", preferredStyle: .alert)
        let newGame = UIAlertAction(title: "New Game", style: .default) { (action) in
            self.startButton.isHidden = false
            self.ballDynamicItem.resistance = 10000000
            self.viewDidLoad()
        }
        gameOver.addAction(newGame)
        present(gameOver, animated: true, completion: nil)
    }
    
    func reset() {
        ballView.isHidden = false
        brickOne.isHidden = false
        brickTwo.isHidden = false
        brickThree.isHidden = false
        brickFour.isHidden = false
        brickFive.isHidden = false
        brickSix.isHidden = false
        brickSeven.isHidden = false
        brickEight.isHidden = false
        brickNine.isHidden = false
        brickOne.backgroundColor = .white
        brickTwo.backgroundColor = .white
        brickThree.backgroundColor = .white
        brickFour.backgroundColor = .white
        brickFive.backgroundColor = .white
        brickSix.backgroundColor = .white
        brickSeven.backgroundColor = .white
        brickEight.backgroundColor = .white
        brickNine.backgroundColor = .white
        ballView.center.x = 200
        ballView.center.y = 438
        brickCount = 9
        animatorsRunning = true
        dynamicBehaviors()
    }

        
    @IBAction func startButton(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            startButton.isHidden = true
            reset()
            let synth = AVSpeechSynthesizer()
            let utterance = AVSpeechUtterance(string: "Gameday")
            synth.speak(utterance)
            dynamicBehaviors()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            startButton.setTitle("Start", for: .normal)
        }
        
        
    }
    @IBAction func resetButton(_ sender: UIButton) {
        startButton.isHidden = false
        ballDynamicItem.resistance = 10000000
        viewDidLoad()
    }
    
}
