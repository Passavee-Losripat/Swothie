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
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var viewModel: GameModel?
    var spawnDelay: TimeInterval = 1.0
    let smoothieTower = SKSpriteNode(imageNamed: "SmoothieTower")
    var enemies: [SKSpriteNode] = []
    var friends: [SKSpriteNode] = []
    var spriteCache = [String: UIImage]()
    
    struct PhysicsCategory {
        static let none : UInt32 = 0
        static let all : UInt32 = UInt32.max
        static let enemy : UInt32 = 0b1
        static let friend :UInt32 = 0b1
        static let projectile: UInt32 = 0b10
    }
    
    func spawnEnemy() {
        let fruitImage = randomFruit()
        let threat = randomThreatData()
        let key = fruitImage + threat.message
        var enemyImage:UIImage
        
        if let cacheImage = ImageCache.shared.getImage(forKey: key) {
            enemyImage = cacheImage
        }
        else if let newImage = renderImage(from: PlantTowerEnemyView(sign: threat, imageName: fruitImage), size: CGSize(width: 250, height: 250)) {
            enemyImage = newImage
            ImageCache.shared.setImage(newImage, forKey: key)
        }
        else{
            enemyImage = UIImage(named: "Pot.png") ?? UIImage()
        }
        let texture = SKTexture(image: enemyImage)
        let enemy = SKSpriteNode(texture: texture)
        enemy.position = CGPoint(x: size.width + enemy.size.width/2, y: randomSpawnPoint(max: size.height - enemy.size.height/2, min: enemy.size.height/2))
        enemy.size = CGSize(width: 250, height: 250)
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        enemy.physicsBody?.contactTestBitMask = PhysicsCategory.projectile
        enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
        enemies.append(enemy)
        addChild(enemy)
            
        let moveDuration = randomSpawnPoint(max: 4.0, min: 2.0)
        let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2, y: enemy.position.y), duration: TimeInterval(moveDuration))
        let actionRemove = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([actionMove, actionRemove]))
    }
    
    func spawnFriend() {
        let fruitImage = randomFruit()
        let opportunity = randomOpportunityData()
        let key = fruitImage + opportunity.message
        var friendImage: UIImage
        
        if let cacheImage = ImageCache.shared.getImage(forKey: key) {
            friendImage = cacheImage
        }
        else if let newImage = renderImage(from: PlantTowerEnemyView(sign: opportunity, imageName: fruitImage), size: CGSize(width: 250, height: 250)) {
            friendImage = newImage
            ImageCache.shared.setImage(newImage, forKey: key)
        }
        else {
            friendImage = UIImage(named: "Pot.png") ?? UIImage()
        }
        let texture = SKTexture(image: friendImage)
        let friend = SKSpriteNode(texture: texture)
        friend.position = CGPoint(x: size.width + friend.size.width/2, y: randomSpawnPoint(max: size.height - friend.size.height/2, min: friend.size.height/2))
        friend.size = CGSize(width: 250, height: 250)
        friend.physicsBody = SKPhysicsBody(rectangleOf: friend.size)
        friend.physicsBody?.isDynamic = true
        friend.physicsBody?.categoryBitMask = PhysicsCategory.friend
        friend.physicsBody?.contactTestBitMask = PhysicsCategory.projectile
        friend.physicsBody?.collisionBitMask = PhysicsCategory.none
        friends.append(friend)
        addChild(friend)
            
        let moveDuration = randomSpawnPoint(max: 4.0, min: 2.0)
        let actionMove = SKAction.move(to: CGPoint(x: -friend.size.width/2, y: friend.position.y), duration: TimeInterval(moveDuration))
        let actionRemove = SKAction.removeFromParent()
            friend.run(SKAction.sequence([actionMove, actionRemove]))
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
        projectile.removeFromParent()
        monster.removeFromParent()
        if let index = enemies.firstIndex(of: monster){
            enemies.remove(at: index)
        }
    }
    
    func projectileDidCollideWithFriends(projectile: SKShapeNode, friend: SKSpriteNode){
        projectile.removeFromParent()
        friend.removeFromParent()
        if let index = friends.firstIndex(of: friend){
            friends.remove(at: index)
        }
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
                projectileDidCollideWithMonster(projectile: projectile, monster: monster)
            }
        }
        else if ((firstBody.categoryBitMask & PhysicsCategory.friend != 0) &&
                 (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
            if let projectile = firstBody.node as? SKShapeNode,
               let friend = secondBody.node as? SKSpriteNode {
                projectileDidCollideWithFriends(projectile: projectile, friend: friend)
            }
            
        }
    }
    
    override func didMove(to view: SKView) {

        let background = SKSpriteNode(imageNamed: "TowerSceneBackground")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = -1
        addChild(background)
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        smoothieTower.position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)
        smoothieTower.size = CGSize(width: 150, height: 150)
        addChild(smoothieTower)
        
        let spawnAction = SKAction.run { [weak self] in
                self?.randomSpawnEnemy()
        }
        
        let delayAction = SKAction.wait(forDuration: spawnDelay)
        let sequenceAction = SKAction.sequence([spawnAction, delayAction])
        run(SKAction.repeatForever(sequenceAction))
        
        let backgroundMusic = SKAudioNode(fileNamed: "EpicBGM.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        run(SKAction.playSoundFileNamed("shootSound.mp3", waitForCompletion: false))
        
        let touchLocation = touch.location(in: self)
          
        let projectile = SKShapeNode(circleOfRadius: 25)
        projectile.fillColor = SKColor.red
        projectile.position = smoothieTower.position
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
        enemies = enemies.filter { enemy in
                if enemy.position.x < 0 {
                    viewModel?.lifePoint -= 100
                    enemy.removeFromParent()
                    return false
                }
                return true
        }
        
        friends = friends.filter { friend in
                if friend.position.x < 0 {
                    viewModel?.score += 100
                    friend.removeFromParent()
                    return false
                }
                return true
        }
    }

}

struct TowerDefenceGameView: View {
    @ObservedObject var viewModel = GameModel()
    @Binding var gameOver: Bool
    var scene: GameScene {
        let scene = GameScene()
        scene.size = CGSize(width: 1000, height: 800)
        scene.scaleMode = .fill
        scene.viewModel = viewModel
        return scene
    }
    
    var body: some View {
        ZStack{
            SpriteView(scene: scene)
                .frame(width: 1000, height: 700)
                .onReceive(viewModel.$lifePoint) { currentLife in
                    if currentLife <= 0 {
                        gameOver = true
                    }
                }
                .onAppear {
                    scene.viewModel = viewModel
                }
        }
    }
}

struct TowerDefenceGameView_Previews: PreviewProvider {
    @State static var controlVariable: Bool = false
    @State static var score: Int = 0
    @StateObject var viewModel = GameModel()
    
    static var previews: some View {
        TowerDefenceGameView(gameOver: $controlVariable)
    }
}
