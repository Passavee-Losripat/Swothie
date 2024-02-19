//
//  SwiftUIView 2.swift
//  
//
//  Created by Passavee Losripat on 17/2/2567 BE.
//

import SwiftUI
import SpriteKit
import Combine

class GameModel: ObservableObject {
    @Published var score: Int = 0
    @Published var lifePoint: Int = 700
    @Published var spawnDelay: TimeInterval = 5.0
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var viewModel: GameModel?
    var spawnDelay: TimeInterval = 1.0
    let smoothieTower = SKSpriteNode(imageNamed: "SmoothieTower")
    
    //This is for development: Please Delete before production
    var fpsLabel: SKLabelNode!
    var spawnDelayLabel: SKLabelNode!
    var nodeCountLabel: SKLabelNode!
    private var lastUpdateTimeInterval: TimeInterval = 0
    
    struct PhysicsCategory {
        static let none : UInt32 = 0
        static let all : UInt32 = UInt32.max
        static let enemy : UInt32 = 0b1
        static let friend :UInt32 = 0b10
        static let projectile: UInt32 = 0b10
    }
    
    func spawnEnemy() {
        if let enemyImage = renderImage(from: PlantTowerEnemyView(), size: CGSize(width: 300, height: 300)) {
            let texture = SKTexture(image: enemyImage)
            let enemy = SKSpriteNode(texture: texture)
            enemy.position = CGPoint(x: size.width + enemy.size.width/2, y: randomSpawnPoint(max: size.height - enemy.size.height/2, min: enemy.size.height/2))
            enemy.size = CGSize(width: 250, height: 250)
            enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
            enemy.physicsBody?.isDynamic = true
            enemy.physicsBody?.categoryBitMask = PhysicsCategory.enemy
            enemy.physicsBody?.contactTestBitMask = PhysicsCategory.projectile
            enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
            
            addChild(enemy)
            
            let moveDuration = randomSpawnPoint(max: 4.0, min: 2.0)
            let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2, y: enemy.position.y), duration: TimeInterval(moveDuration))
            let actionRemove = SKAction.removeFromParent()
            enemy.run(SKAction.sequence([actionMove, actionRemove]))
        }
    }
    
    func spawnFriend() {
        if let friendImage = renderImage(from: PlantTowerFriendView(), size: CGSize(width: 300, height: 300)) {
            let texture = SKTexture(image: friendImage)
            let friend = SKSpriteNode(texture: texture)
            friend.position = CGPoint(x: size.width + friend.size.width/2, y: randomSpawnPoint(max: size.height - friend.size.height/2, min: friend.size.height/2))
            friend.size = CGSize(width: 250, height: 250)
            friend.physicsBody = SKPhysicsBody(rectangleOf: friend.size)
            friend.physicsBody?.isDynamic = true
            friend.physicsBody?.categoryBitMask = PhysicsCategory.friend
            friend.physicsBody?.contactTestBitMask = PhysicsCategory.projectile
            friend.physicsBody?.collisionBitMask = PhysicsCategory.none
            
            addChild(friend)
            
            let moveDuration = randomSpawnPoint(max: 4.0, min: 2.0)
            let actionMove = SKAction.move(to: CGPoint(x: -friend.size.width/2, y: friend.position.y), duration: TimeInterval(moveDuration))
            let actionRemove = SKAction.removeFromParent()
            friend.run(SKAction.sequence([actionMove, actionRemove]))
        }
    }
    
    func randomSpawnEnemy() {
        if (Int.random(in: 0...1) == 0){
            spawnEnemy()
        }
        else{
            spawnFriend()
        }
    }
    
    func projectileDidCollideWithMonster(projectile: SKShapeNode, monster: SKSpriteNode) {
        //Should replace all of SKShapeNode to SKSpriteNode when add ball image
      projectile.removeFromParent()
      monster.removeFromParent()
    }
    
    func projectileDidCollideWithFriends(projectile: SKShapeNode, friend: SKSpriteNode){
        //Should replace all of SKShapeNode to SKSpriteNode when add ball image
        projectile.removeFromParent()
        friend.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        if ((firstBody.categoryBitMask & PhysicsCategory.enemy != 0) &&
          (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
            if let monster = firstBody.node as? SKSpriteNode,
               let projectile = secondBody.node as? SKShapeNode {
                //Should replace all of SKShapeNode to SKSpriteNode when add ball image
                projectileDidCollideWithMonster(projectile: projectile, monster: monster)
            }
        }
        else if ((firstBody.categoryBitMask & PhysicsCategory.friend != 0) &&
                 (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
            if let projectile = firstBody.node as? SKShapeNode,
               let friend = secondBody.node as? SKSpriteNode {
                //Should replace all of SKShapeNode to SKSpriteNode when add ball image
                projectileDidCollideWithFriends(projectile: projectile, friend: friend)
            }
            
        }
    }
    
    func updateSpawnDelay(_ newDelay: TimeInterval) {
        self.removeAction(forKey: "spawningAction")
        let spawnAction = SKAction.run { [weak self] in
            self?.randomSpawnEnemy()
        }
        let delayAction = SKAction.wait(forDuration: newDelay)
        let sequenceAction = SKAction.sequence([spawnAction, delayAction])
        self.run(SKAction.repeatForever(sequenceAction), withKey: "spawningAction")
    }
    
    override func didMove(to view: SKView) {
        //All label is for development: Please Delete before Production
        fpsLabel = SKLabelNode(fontNamed: "Arial")
        fpsLabel.position = CGPoint(x: 10, y: view.frame.size.height - 30) // Adjust position as needed
        fpsLabel.fontSize = 18
        fpsLabel.horizontalAlignmentMode = .left
        fpsLabel.text = "FPS: 0"
        //addChild(fpsLabel)
        
        spawnDelayLabel = SKLabelNode(fontNamed: "Arial")
        spawnDelayLabel.position = CGPoint(x: 10, y: view.frame.size.height - 60) // Adjust position as needed
        spawnDelayLabel.fontSize = 18
        spawnDelayLabel.horizontalAlignmentMode = .left
        //addChild(spawnDelayLabel)
        nodeCountLabel = SKLabelNode(fontNamed: "Arial")
        nodeCountLabel.position = CGPoint(x: 10, y: view.frame.size.height - 90) // Adjust position as needed
        nodeCountLabel.fontSize = 18
        nodeCountLabel.horizontalAlignmentMode = .left
        //addChild(nodeCountLabel)
        
        /*let background = SKSpriteNode(imageNamed: "swordScene")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2) // Center the background
        background.zPosition = -1 // Ensure it's behind all other nodes
        addChild(background)*/
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        smoothieTower.position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)
        smoothieTower.size = CGSize(width: 150, height: 150)
        addChild(smoothieTower)
        
        let spawnAction = SKAction.run { [weak self] in
                self?.randomSpawnEnemy()
        }
        
        /*guard let spawnDelayTime = viewModel?.spawnDelay else {
                return
        }*/
        let delayAction = SKAction.wait(forDuration: spawnDelay)
        let sequenceAction = SKAction.sequence([spawnAction, delayAction])
        run(SKAction.repeatForever(sequenceAction))
        
        //Change Name of Background Music Here
        /*let backgroundMusic = SKAudioNode(fileNamed: "background-music-aac.caf")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)*/
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        //Add Sound Effect File Here
        //run(SKAction.playSoundFileNamed("pew-pew-lei.caf", waitForCompletion: false))
        
        let touchLocation = touch.location(in: self)
          
          //let projectile = SKSpriteNode(imageNamed: "projectile")
        let projectile = SKShapeNode(circleOfRadius: 25)
        projectile.fillColor = SKColor.red
        projectile.position = smoothieTower.position
        //projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: 12.5)
        projectile.physicsBody?.isDynamic = true
        projectile.physicsBody?.categoryBitMask = PhysicsCategory.projectile
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.friend
        projectile.physicsBody?.collisionBitMask = PhysicsCategory.none
        projectile.physicsBody?.usesPreciseCollisionDetection = true

        let offset = touchLocation - projectile.position
          
        if offset.x < 0 { return }
          
        addChild(projectile)
          
        let direction = offset.normalized()

        let shootAmount = direction * 1000
          
        let realDest = shootAmount + projectile.position
          
        let actionMove = SKAction.move(to: realDest, duration: 1.5)
        let actionMoveDone = SKAction.removeFromParent()
          projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Compute FPS
        if lastUpdateTimeInterval > 0 {
            let delta = currentTime - lastUpdateTimeInterval
            let fps = 1 / delta
            fpsLabel.text = "FPS: \(Int(fps))"
        }
        lastUpdateTimeInterval = currentTime

        // Update spawn delay (assuming you have a way to access it, e.g., through a viewModel)
        guard let spawnDelayTimeLabel = viewModel?.spawnDelay else {
            return
        }
        spawnDelayLabel.text = "Spawn Delay: \(spawnDelayTimeLabel)"
        
        // Update node count
        nodeCountLabel.text = "Nodes: \(self.children.count)"
        
        self.children.forEach { node in
            if let sprite = node as? SKSpriteNode {
                if sprite.physicsBody?.categoryBitMask == PhysicsCategory.enemy, sprite.position.x < 0 {
                    viewModel?.lifePoint -= 100
                    sprite.removeFromParent()
                }
                else if sprite.physicsBody?.categoryBitMask == PhysicsCategory.friend, sprite.position.x < 0 {
                    viewModel?.score += 100
                    sprite.removeFromParent()
                }
            }
        }
    }

}

struct TowerDefenceGameView: View {
    @StateObject var viewModel = GameModel()
    var scene: GameScene {
        let scene = GameScene()
        scene.size = CGSize(width: 1000, height: 800)
        scene.scaleMode = .fill
        scene.viewModel = viewModel
        return scene
    }
    
    var body: some View {
        ZStack{
            /*Image("TowerDefenceScene")
                .resizable()
                .scaledToFill()*/
            SpriteView(scene: scene)
                .frame(width: 1000, height: 800)
        }
    }
}

#Preview {
    TowerDefenceGameView()
}
