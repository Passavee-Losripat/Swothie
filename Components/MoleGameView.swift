//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct MoleGameView: View {
    
    @Binding var gameOver:Bool
    @Binding var score: Int
    @State var lifePoint: Int = 5
    @State var time:Int = 45
    @State var rageMode: Bool = false
    @State var pots: [Bool] = Array(repeating: false, count: 9)
    @State var moleIndex:Int = randomMole()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
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
                                    if (time%2 == 0 && time != 14){
                                        moleIndex = randomMole()
                                        while (pots[moleIndex]){
                                            if (pots.allSatisfy { $0 == true }){
                                                break
                                            }
                                            moleIndex = randomMole()
                                        }
                                        pots[moleIndex] =  true
                                    }
                                }
                                else{
                                    if (time%3 == 0){
                                        moleIndex = randomMole()
                                        while (pots[moleIndex]){
                                            if (pots.allSatisfy { $0 == true }){
                                                break
                                            }
                                            
                                            moleIndex = randomMole()
                                        }
                                        pots[moleIndex] =  true
                                    }
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
                    InstructionView(text:rageMode ? "It's harvest season! The fruit will spawn faster." : "Tap all \"weakness\" fruits!")
                        .padding()
                }
                Spacer()
                ForEach(0..<3){ row in
                    HStack {
                        ForEach(0..<3) { column in
                            PlantMoleView(rageMode: rageMode, hasMole: $pots[row * 3 + column], lifePoint: $lifePoint, score: $score, gameOver: $gameOver)
                                .padding()
                        }
                    }
                }
                Spacer()
            }
            .onDisappear {
                timer.upstream.connect().cancel()
            }
            if (rageMode){
                MiddleNotification(text: "HARVEST SEASON")
            }
        }
    }
}

struct MoleGameView_Previews: PreviewProvider {
    @State static var controlVariable: Bool = false
    @State static var score: Int = 0
    
    static var previews: some View {
        MoleGameView(gameOver: $controlVariable, score: $score)
    }
}
