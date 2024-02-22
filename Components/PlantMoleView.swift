//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct PlantMoleView: View {
    @State var sign: swStructure = swStructure(message: "", isWeakness: true)
    @State var imageName:String = ""
    @State private var opacity:Double = 0
    @State private var offset:CGFloat = 500
    @State private var showTime: Int = 5
    @State var rageMode:Bool
    @Binding var hasMole: Bool
    @Binding var lifePoint: Int
    @Binding var score: Int
    @Binding var gameOver:Bool
    
    @State private var plantTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if (hasMole) {
                Group {
                    ButtonText(text: sign.message, size: 20)
                    Image(imageName)
                        .resizable()
                        .frame(maxWidth: 150, maxHeight: 150)
                        .onAppear()
                }
                //.offset(y: self.offset)
                .opacity(opacity)
                .onReceive(plantTimer) { _ in
                    if (showTime>0) {
                        if (rageMode) {
                            showTime -= 2
                        }
                        else {
                            showTime -= 1
                        }
                    } else {
                        hasMole  = false
                        plantTimer.upstream.connect().cancel()
                    }
                }
                .onAppear {
                sign = randomSWData()
                imageName = randomFruit()
                    withAnimation(.easeOut(duration: 0.3)){
                        self.opacity = 1
                        self.offset = 0
                    }
                }
                .onDisappear {
                    plantTimer.upstream.connect().cancel()
                    withAnimation(.easeOut(duration: 0.3)) {
                        self.offset = 500
                        self.opacity = 0
                    }
                }
            }
            if (!hasMole) {
                Image("Pot")
                    .resizable()
                    .frame(maxWidth: 150, maxHeight: 150)
            }
        }
        .frame(maxWidth: 300, maxHeight: 200)
        .onTapGesture {
            if (hasMole) {
                SoundEffectManager.shared.playSoundEffect(fileName: "clickSound", fileType: "wav")
                hasMole.toggle()
                if (sign.isWeakness) {
                    score += 100
                }
                else {
                    lifePoint -= 1
                    if (lifePoint == 0) {
                        gameOver = true
                    }
                }
        }
        }
    }
}

struct PreviewWrapper: View {
    @State private var hasMole: Bool = false
    @State var lifePoint: Int = 100
    @State var score: Int = 0
    @State var gameOver:Bool = false

    var body: some View {
        VStack {
            Button("Toggle Mole") {
                hasMole.toggle()
            }
            Spacer()
            PlantMoleView(rageMode: true, hasMole: $hasMole, lifePoint: $lifePoint, score: $score, gameOver: $gameOver)
        }
    }
}

struct MoleView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
