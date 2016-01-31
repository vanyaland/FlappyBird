//
//  GameScene.swift
//  FlappyBird
//
//  Created by Иван Магда on 31.01.16.
//  Copyright (c) 2016 Ivan Magda. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    //----------------------------------
    // MARK: - Properties
    //----------------------------------
    
    /// Flapp bird node.
    var flappyBird = SKSpriteNode()
    
    /// Background node.
    var background = SKSpriteNode()

    //----------------------------------
    // MARK: - View life cycle
    //----------------------------------
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        setupBackgroundNode()
        setupFlappyBirdNode()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    //----------------------------------
    // MARK: - Sprite nodes
    //----------------------------------
    
    private func setupBackgroundNode() {
        // Create background texture.
        let backgroundTexture = SKTexture(imageNamed: "bg.png")
        
        // Create forever move background action.
        let moveBackground = SKAction.moveByX(-backgroundTexture.size().width, y: 0.0, duration: 9.0)
        let replaceBackground = SKAction.moveByX(backgroundTexture.size().width, y: 0.0, duration: 0.0)
        let moveBackgroundForever = SKAction.repeatActionForever(SKAction.sequence([moveBackground, replaceBackground]))
        
        for var i: CGFloat = 0; i < 3; ++i {
            self.background = SKSpriteNode(texture: backgroundTexture)
            
            self.background.position = CGPoint(x: backgroundTexture.size().width / 2.0 + backgroundTexture.size().width * i, y: CGRectGetMidY(self.frame))
            self.background.size.height = CGRectGetHeight(self.frame)
            self.background.runAction(moveBackgroundForever)
            
            self.addChild(background)
        }
    }
    
    private func setupFlappyBirdNode() {
        // Create bird textures.
        let birdTextureWingsUp   = SKTexture(imageNamed: "flappy1.png")
        let birdTextureWingsDown = SKTexture(imageNamed: "flappy2.png")
        
        // Create forever flapp animation.
        let animation = SKAction.animateWithTextures([birdTextureWingsUp, birdTextureWingsDown], timePerFrame: 0.1)
        let makeBirdFlap = SKAction.repeatActionForever(animation)
        
        // Setup flappy bird node.
        self.flappyBird = SKSpriteNode(texture: birdTextureWingsUp)
        self.flappyBird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.flappyBird.runAction(makeBirdFlap)
        
        self.addChild(flappyBird)
    }
}
