//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 14/2/2567 BE.
//

import SwiftUI
import SpriteKit

struct TowerDefenseView: View {
    @State var showInstruction: Bool = true
    @State var gameOver: Bool = false
    @State var changeView:Bool = false
    @State var rageMode:Bool = false
    @State private var time:Int = 45
    @StateObject var viewModel = GameModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var scene: GameScene {
        let scene = GameScene()
        scene.size = CGSize(width: 1000, height: 800)
        scene.scaleMode = .fill
        scene.viewModel = viewModel
        return scene
    }
    
    var body: some View {
        NavigationView{
            if (changeView){
                OTMissedView()
            }
            else {
                ZStack {
                    Image("TowerDefenceScene")
                        .resizable()
                        .scaledToFill()
                if (showInstruction) {
                    CardView(topic: "How to play", explanation: "In this game, you have to prevent the approaching threats but let the opportunity to come in our village to get the score. Protect our village at all cost!", exitText: "Let's go!", controlVariable: $showInstruction)
                }
                else if (gameOver){
                    CardView(topic: "Game Over", explanation: "You get the high score of \(viewModel.score). Not Bad!", exitText: "Let's see what I missed", controlVariable: $changeView)
                }
                else{
                    VStack{
                        HStack{
                            Text(time/10>=1 ? "\(Image(systemName: "clock.fill")) 00:\(time)": "\(Image(systemName: "clock.fill")) 00:0\(time)")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundColor(Color.tomatoRed)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 17)
                                    .stroke(Color.tomatoRed, lineWidth: 7)
                                )
                                .padding()
                            
                            Text("\(Image(systemName: "heart.fill")) \(viewModel.lifePoint)")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundColor(Color.tomatoRed)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.white)
                                .overlay(RoundedRectangle(cornerRadius: 17)
                                    .stroke(Color.tomatoRed, lineWidth: 7)
                                )
                            Spacer()
                            InstructionView(text:rageMode ? "It's harvest season! The fruit will spawn faster." : "Tap all of the threats of smoothie shop!")
                                .padding()
                        }
                        Spacer()
                        SpriteView(scene: scene)
                            .frame(width: 1000, height: 700)
                            .onReceive(viewModel.$lifePoint) { currentLife in
                                                if currentLife <= 0 {
                                                    gameOver = true
                                                }
                            }
                            .onReceive(timer) {  _ in
                                if (time > 0) {
                                    /*if (time == 15) {
                                        rageMode = true
                                    }*/
                                    
                                    if rageMode {
                                        scene.updateSpawnDelay(0.5)
                                    }
                                    else{
                                        scene.viewModel?.spawnDelay = 3.0
                                    }
                                    time -= 1
                                } else {
                                    gameOver = true
                                    timer.upstream.connect().cancel()
                                }
                            }
                            .onAppear {
                                scene.viewModel = viewModel
                            }
                        Spacer()
                    }
                    if rageMode {
                        MiddleNotification(text: "HARVEST SEASON")
                    }
                }
            }
        }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

#Preview {
    TowerDefenseView()
}
