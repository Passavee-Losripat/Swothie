//
//  SwiftUIView 2.swift
//  
//
//  Created by Passavee Losripat on 17/2/2567 BE.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    struct PhysicsCategory {
      static let none      : UInt32 = 0
      static let all       : UInt32 = UInt32.max
      static let monster   : UInt32 = 0b1       // 1
      static let projectile: UInt32 = 0b10      // 2
    }
    
    let smoothieTower = SKSpriteNode(imageNamed: "SmoothieTower")
    
    func spawnEnemy() {
        if let enemyImage = renderImage(from: PlantTowerEnemyView(), size: CGSize(width: 300, height: 300)) {
            let texture = SKTexture(image: enemyImage)
            let enemy = SKSpriteNode(texture: texture)
            enemy.position = CGPoint(x: size.width + enemy.size.width/2, y: randomSpawnPoint(max: size.height - enemy.size.height/2, min: enemy.size.height/2))
            enemy.size = CGSize(width: 250, height: 250)
            
            addChild(enemy)
            
            let moveDuration = randomSpawnPoint(max: 4.0, min: 2.0)
            let actionMove = SKAction.move(to: CGPoint(x: -enemy.size.width/2, y: enemy.position.y), duration: TimeInterval(moveDuration))
            let actionRemove = SKAction.removeFromParent()
            enemy.run(SKAction.sequence([actionMove, actionRemove]))
        }
    }
    
    func projectileDidCollideWithMonster(projectile: SKSpriteNode, monster: SKSpriteNode) {
      print("Hit")
      projectile.removeFromParent()
      monster.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
      // 1
      var firstBody: SKPhysicsBody
      var secondBody: SKPhysicsBody
      if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
        firstBody = contact.bodyA
        secondBody = contact.bodyB
      } else {
        firstBody = contact.bodyB
        secondBody = contact.bodyA
      }
     
      // 2
      if ((firstBody.categoryBitMask & PhysicsCategory.monster != 0) &&
          (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
        if let monster = firstBody.node as? SKSpriteNode,
          let projectile = secondBody.node as? SKSpriteNode {
          projectileDidCollideWithMonster(projectile: projectile, monster: monster)
        }
      }
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        smoothieTower.position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)
        smoothieTower.size = CGSize(width: 150, height: 150)
        addChild(smoothieTower)
        
        let spawnAction = SKAction.run { [weak self] in
                self?.spawnEnemy()
        }
        
        let delayAction = SKAction.wait(forDuration: 1.0)
        let sequenceAction = SKAction.sequence([spawnAction, delayAction])
        run(SKAction.repeatForever(sequenceAction))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
          }
        let touchLocation = touch.location(in: self)
          
          // 2 - Set up initial location of projectile
          //let projectile = SKSpriteNode(imageNamed: "projectile")
        let projectile = SKShapeNode(circleOfRadius: 10) // Radius of the red ball
        projectile.fillColor = SKColor.red
        projectile.position = smoothieTower.position
        //projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: 5)
        projectile.physicsBody?.isDynamic = true
        projectile.physicsBody?.categoryBitMask = PhysicsCategory.projectile
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.monster
        projectile.physicsBody?.collisionBitMask = PhysicsCategory.none
        projectile.physicsBody?.usesPreciseCollisionDetection = true

          
          // 3 - Determine offset of location to projectile
        let offset = touchLocation - projectile.position
          
          // 4 - Bail out if you are shooting down or backwards
        if offset.x < 0 { return }
          
          // 5 - OK to add now - you've double checked position
        addChild(projectile)
          
          // 6 - Get the direction of where to shoot
        let direction = offset.normalized()
          
          // 7 - Make it shoot far enough to be guaranteed off screen
        let shootAmount = direction * 1000
          
          // 8 - Add the shoot amount to the current position
        let realDest = shootAmount + projectile.position
          
          // 9 - Create the actions
        let actionMove = SKAction.move(to: realDest, duration: 1.5)
        let actionMoveDone = SKAction.removeFromParent()
          projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
}

struct TowerDefenceGameView: View {
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 1000, height: 800)
        scene.scaleMode = .fill
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
