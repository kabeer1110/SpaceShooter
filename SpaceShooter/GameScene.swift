//
//  GameScene.swift
//  SpaceShooter
//
//  Created by YuryG on 2/6/17.

import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {
    // "global to object"
    var score = 0
    let winningScore = 2000
    var bestScore = 0
    
    let bubbleSize: CGFloat = 15.0
    let bubbleSpeed = 500
    
    //properties, define must "?"
    var player: SKSpriteNode?  //optional, "nil"
    var enemy: SKSpriteNode? //
    var laser: SKShapeNode?
    var label : SKLabelNode?
    
    // Setup, first thing to get called. App called.
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        print("Hello I'm in didMove to view")  //"format a string"

        // as is "casting"
        player = self.childNode(withName: "player") as! SKSpriteNode?
        enemy = self.childNode(withName: "squid") as! SKSpriteNode?
        label = self.childNode(withName: "myLabel") as! SKLabelNode?

        
//        makeLaser()
       makeBubble()
        updateLabel()
    }
    
   
//    
//    func makeLaser(){
//        laser = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 20, height: 20))
//        laser?.fillColor = UIColor.red
//        laser?.position = (player?.position)!
//        
//        laser?.physicsBody = SKPhysicsBody(rectangleOf: (laser?.frame.size)!)
//        laser?.physicsBody?.affectedByGravity = false
//        laser?.physicsBody?.velocity = CGVector(dx: 100, dy: 800)
//        laser?.physicsBody?.contactTestBitMask = 5
//        
//        self.addChild(laser!)
//
//    }

    
    func makeBubble(){
        laser = SKShapeNode(circleOfRadius: bubbleSize)
        
        laser?.strokeColor = UIColor.green
        laser?.fillColor = UIColor.red
        
        laser?.position = (player?.position)!
        
        laser?.physicsBody = SKPhysicsBody(rectangleOf: (laser?.frame.size)!)
        laser?.physicsBody?.affectedByGravity = false
        laser?.physicsBody?.velocity = CGVector(dx: 0, dy: bubbleSpeed)
        laser?.physicsBody?.contactTestBitMask = 5
        
        self.addChild(laser!)}
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches began")
        
//        makeLaser()
      makeBubble()
        
        for  t in touches {
            print("t= \(t.location(in: self))")

            player?.position.x = t.location(in: self).x
        
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches moved")
        
        
        for  t in touches {
            // print out where the finger touched
            print("t= \(t.location(in: self))")
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x

//            makeLaser()
            makeBubble()
            
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
        
        
        for  t in touches {
            // print out where the finger touched
            print("t= \(t.location(in: self))")
            
            // move player's X position to that point.
            player?.position.x = t.location(in: self).x
//            makeLaser()
            
            makeBubble()
            
        }

    }
    
    
    
    
    func updateLabel(){
        label?.text = "AJ Cyborg: \(score) "
        
        if score >= winningScore{
            label?.text = "AJ; You Have Won! "

        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
       // print("we have contact btw \(contact.bodyA) \(contact.bodyB)")
       
        if (contact.bodyA.contactTestBitMask == 5){
        score = score + 1
        updateLabel()
            contact.bodyA.node?.removeFromParent()
     
            
            }
        
        if (contact.bodyB.contactTestBitMask == 5){
            score = score + 1
            updateLabel()
            
           
        }
        
        if ((contact.bodyA.contactTestBitMask == 5) || (contact.bodyA.contactTestBitMask == 5)){

            
        }
        
        if ((contact.bodyB.contactTestBitMask == 5) || (contact.bodyB.contactTestBitMask == 5)){

        }
        
        
        }

}
