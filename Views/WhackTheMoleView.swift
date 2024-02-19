//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct WhackTheMoleView: View {
    @State var showInstruction: Bool = true
    @State var gameOver: Bool = false
    @State var score:Int = 0
    @State var changeView:Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            if (changeView){
                SWMissedView()
            }
            else {
                ZStack {
                Rectangle()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .foregroundColor(Color.bluePastel)
                    .scaledToFill()
                Circle()
                        .frame(maxWidth:1150)
                        .foregroundColor(.white)
                        .scaledToFit()
                if (showInstruction) {
                    CardView(topic: "How to play", explanation: "In this game, you have to beat all of your weakness and avoid touching strength point of our smoothie village. Try to think what can be good or bad for our smoothie product!", exitText: "Let's go!", controlVariable: $showInstruction)
                }
                else if (gameOver){
                    CardView(topic: "Game Over", explanation: "You get the high score of \(score). Not Bad!", exitText: "Let's see what I missed", controlVariable: $changeView)
                }
                else{
                    ZStack{
                        MoleGameView(gameOver: $gameOver, score: $score)
                            .frame(maxWidth: 900, maxHeight: 800)
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
    WhackTheMoleView()
}
