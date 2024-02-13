//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI
import SpriteKit

struct WhackTheMoleView: View {
    @State var showInstruction: Bool = true
    @State var gameOver: Bool = false
    @State var score:Int = 0
    @State var changeView:Bool = false
    var body: some View {
        NavigationView{
            if (changeView){
                TowerDefenseView()
            }
            else {
                ZStack {
                Rectangle()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                if (showInstruction) {
                    CardView(topic: "How to play", explanation: "In this game, you have to beat all of your weakness and avoid touching strength point of our smoothie village. Try to think what can be good or bad for our smoothie product!", exitText: "Let's go!", controlVariable: $showInstruction)
                }
                else if (gameOver){
                    CardView(topic: "Game Over", explanation: "You get the high score of \(score). Not Bad!", exitText: "Let's continue to next game", controlVariable: $changeView)
                }
                else{
                    MoleGameView(gameOver: $gameOver, score: $score)
                        .frame(maxWidth: 900, maxHeight: 800)
                }
            }
        }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}

#Preview {
    WhackTheMoleView()
}
