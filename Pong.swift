//
//  Pong.swift
//  Games
//
//  Created by period2 on 5/17/21.
//

import UIKit

class Pong: UIViewController, UICollisionBehaviorDelegate {
    
    
    @IBOutlet weak var playerOnePaddle: UIView!
    @IBOutlet weak var playerTwoPaddle: UIView!
    @IBOutlet weak var ball: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playertwoLabel: UILabel!
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var paddleDynamicItem: UIDynamicItemBehavior!
    var ballDynamicItem: UIDynamicItemBehavior!
    var p1score = 0
    var p2score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.cornerRadius = 12.5
        ball.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playerOnePaddleMovement(_ sender: UIPanGestureRecognizer) {
        playerOnePaddle.center = CGPoint(x: sender.location(in: view).x, y: playerOnePaddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: playerOnePaddle)
    }
    
    @IBAction func playerTwoPaddleMovement(_ sender: UIPanGestureRecognizer) {
        playerTwoPaddle.center = CGPoint(x: sender.location(in: view).x, y: playerTwoPaddle.center.y)
        dynamicAnimator.updateItem(usingCurrentState: playerTwoPaddle)
    }
    
    func dynamicBehaviors() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        collisionBehavior = UICollisionBehavior(items: [playerOnePaddle, playerTwoPaddle, ball])
        
        pushBehavior.active = true
        pushBehavior.setAngle(CGFloat(Int.random(in: 0 ... 180)), magnitude: 0.3)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .everything
        collisionBehavior.collisionDelegate = self
        
        ballDynamicItem = UIDynamicItemBehavior(items: [ball])
        ballDynamicItem.allowsRotation = false
        ballDynamicItem.elasticity = 1
        ballDynamicItem.friction = 0
        ballDynamicItem.resistance = -0.03
        
        paddleDynamicItem = UIDynamicItemBehavior (items: [playerOnePaddle, playerTwoPaddle])
        paddleDynamicItem.density = 99999999999999
        paddleDynamicItem.allowsRotation = false
        paddleDynamicItem.elasticity = 1
        
        dynamicAnimator.addBehavior(pushBehavior)
        dynamicAnimator.addBehavior(collisionBehavior)
        dynamicAnimator.addBehavior(ballDynamicItem)
        dynamicAnimator.addBehavior(paddleDynamicItem)
        
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if ball.center.y > playerOnePaddle.center.y {
            p2score += 1
            startButton.setTitle("Player Two Wins", for: .normal)
            playertwoLabel.text = String(p2score)
            ballDynamicItem.resistance = 1000000
        } else if ball.center.y < playerTwoPaddle.center.y {
            p1score += 1
            startButton.setTitle("Player One Wins", for: .normal)
            playerOneLabel.text = String(p1score)
            ballDynamicItem.resistance = 1000000
        }
    }
    
    
    func reset() {
        playerOnePaddle.center.x = 206.5
        playerOnePaddle.center.y = 749.5
        playerTwoPaddle.center.x = 206.5
        playerTwoPaddle.center.y = 106.6
        ball.center.x = 207.5
        ball.center.y = 448.5
        dynamicBehaviors()
        ball.isHidden = false
        startButton.setTitle("", for: .normal)
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        reset()
        startButton.setTitle("", for: .normal)
        playerOneLabel.text = ""
        playertwoLabel.text = ""
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        reset()
    }
    
}
