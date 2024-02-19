//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 14/2/2567 BE.
//

import SwiftUI

struct TowerDefenseView: View {
    @State var showInstruction: Bool = true
    @State var gameOver: Bool = false
    @State var score:Int = 0
    @State var changeView:Bool = false
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
                    CardView(topic: "How to play", explanation: "In this game, you have to prevent the approaching threats but let the opportunity to come in our village. Protect our village at all cost!", exitText: "Let's go!", controlVariable: $showInstruction)
                }
                else if (gameOver){
                    CardView(topic: "Game Over", explanation: "You get the high score of \(score). Not Bad!", exitText: "Let's see what I missed", controlVariable: $changeView)
                }
                else{
                    TowerDefenceGameView(gameOver: $gameOver, score: $score)
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
