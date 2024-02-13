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
    @State var pots: [Bool] = Array(repeating: true, count: 9)
    
    var body: some View {
        VStack{
            HStack {
                Text("\(Image(systemName: "clock.fill")) 00:\(time)")
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
            }
            Spacer()
            ForEach(0..<3){ row in
                HStack {
                    ForEach(0..<3) { column in
                        PlantMoleView(imageName: "Carrot", sign: swData[0], hasMole: $pots[row * 3 + column])
                            .onTapGesture {
                                pots[row * 3 + column].toggle()
                                if (swData[0].isWeakness) {
                                    score += 100
                                }
                                else {
                                    lifePoint -= 1
                                    if (lifePoint == 0) {
                                        gameOver = true
                                    }
                                }
                            }
                            .padding()
                    }
                }
            }
            Spacer()
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
