//
//  SwiftUIView 2.swift
//  
//
//  Created by Passavee Losripat on 17/2/2567 BE.
//

import SwiftUI

struct TowerDefenceGameView: View {
    @State private var time:Int = 45
    @State private var rageMode:Bool = false
    @State private var lifePoint:Int = 1500
    @Binding var gameOver:Bool
    @Binding var score:Int
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack{
            Image("TowerDefenceScene")
                .resizable()
                .scaledToFill()
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
                        .onReceive(timer) {  _ in
                            if (time > 0) {
                                if (time == 15) {
                                    rageMode = true
                                }
                                
                                if rageMode {
                                    //Make A condition of spawning in rage mode
                                }
                                else{
                                    //Make a condition of spawning in normal mode
                                }
                                time -= 1
                            } else {
                                gameOver = true
                                timer.upstream.connect().cancel()
                            }
                        }
                    
                    Text("\(Image(systemName: "heart.fill")) \(lifePoint)")
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
                Image("SmoothieTower")
                    .resizable()
                    .frame(maxWidth: 300, maxHeight: 300)
                Spacer()
            }
        }
    }
}

struct TowerDefenceGameView_Previews: PreviewProvider {
    @State static var controlVariable: Bool = false
    @State static var score: Int = 0
    
    static var previews: some View {
        TowerDefenceGameView(gameOver: $controlVariable, score: $score)
    }
}
