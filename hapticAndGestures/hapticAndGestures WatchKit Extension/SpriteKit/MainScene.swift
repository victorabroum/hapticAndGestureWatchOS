//
//  MainScene.swift
//  hapticAndGestures WatchKit Extension
//
//  Created by Victor Vasconcelos on 27/11/18.
//  Copyright © 2018 watchsons. All rights reserved.
//

import Foundation
import SpriteKit

class MainScene: SKScene, SKPhysicsContactDelegate {
    
    
    // MARK: Nodes
    var playerNode: SKSpriteNode?
    var coinNode: SKSpriteNode?
    var labelNode: SKLabelNode?
    
    // MARK: Controles
    var directional: Directional = .right
    var playerVelocity: CGFloat = 1
    var gameState: GameState = .pause
    var score: Int = 0
    
    override func sceneDidLoad() {
        self.setupNodes()
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        self.coinRespawn()
    }
    
}


// MARK: Extesion to setup Node
extension MainScene {
    func setupNodes() {
        if let node = self.childNode(withName: "playerNode") as? SKSpriteNode{
            self.playerNode = node
        }
        
        if let node = self.childNode(withName: "coinNode") as? SKSpriteNode{
            self.coinNode = node
        }
        
        if let label = self.childNode(withName: "scoreLabel") as? SKLabelNode {
            self.labelNode = label
        }
    }
}

// MARK: Extesion for swipeGestures
extension MainScene {
    
    func swipeLeft() {
        self.directional = .left
        
        if (self.playerNode?.xScale)! > 0{
            self.playerNode?.xScale *= -1
        }
        
        self.animetePlayer()
        
    }
    
    func swipeRight() {
        self.directional = .right
        
        if (self.playerNode?.xScale)! < 0{
            self.playerNode?.xScale *= -1
        }
        self.animetePlayer()
    }
    
    func swipeUp(){
        self.directional = .up
        self.animetePlayer()
    }
    
    func swipeDown() {
        self.directional = .down
        self.animetePlayer()
    }
    
    func tap(){
        
        if self.gameState == .pause {
            self.gameState = .play
            self.animateMisc()
            self.animetePlayer()
        }else{
            self.gameState = .pause
            self.pauseGame()
        }
        
    }
    
}

// MARK: Update
extension MainScene{
    override func update(_ currentTime: TimeInterval) {
        if self.gameState == .play{
            switch self.directional {
            case .up:
                // Ir para cima
                self.playerNode?.position.y += self.playerVelocity
            case .down:
                // Ir para baixo
                self.playerNode?.position.y -= self.playerVelocity
            case .left:
                self.playerNode?.position.x -= self.playerVelocity
            case .right:
                self.playerNode?.position.x += self.playerVelocity
            }
        }
    }
}

// MARK: Utils
extension MainScene {
    func coinRespawn() {
        
        self.scorePoint()
        
        let randomX = CGFloat.random(in: -70...70)
        let randomY = CGFloat.random(in: -50...50)
        
        self.coinNode?.run(SKAction.move(to: CGPoint(x: randomX, y: randomY), duration: 0))
        
    }
    
    func scorePoint(_ amount: Int = 1) {
        self.score += amount
        self.labelNode?.text = "Score: \(self.score)"
    }
    
    func animetePlayer() {
        
        if gameState == .play {
            switch directional {
            case .up:
                self.playerNode?.run(SKAction(named: "walk_back")!)
            case .down:
                self.playerNode?.run(SKAction(named: "walk_front")!)
            default:
                self.playerNode?.run(SKAction(named: "walk_side")!)
            }
        }
        
    }
    
    func pauseGame() {
        self.playerNode?.removeAllActions()
        self.coinNode?.removeAllActions()
    }
    
    func animateMisc() {
        self.coinNode?.run(SKAction(named: "coin")!)
    }
}
