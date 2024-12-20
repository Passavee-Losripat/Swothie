//
//  SwiftUIView.swift
//
//
//  Created by Passavee Losripat on 14/2/2567 BE.
//

import SwiftUI
import SpriteKit

struct TowerDefenseView: View {
    @State var Score:Int = 0
    @State var showInstruction: Bool = true
    @State var gameOver: Bool = false
    @State var changeView:Bool = false
    @State private var time:Int = 20
    @StateObject var viewModel = GameModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            if (changeView){
                OTMissedView()
            }
            else {
                ZStack {
                    Image("TowerDefenceScene")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    if (showInstruction) {
                        CardView(topic: "How to play", explanation: "Swothie-Defence is a game where you have to prevent \"threat\" fruits from invading our Swothie village but let \"opportunity\" fruits come in. Think thoroughly before tapping \"threat\" fruits or you may hurt our allies. Protect our village at all costs!", exitText: "Let's go!", controlVariable: $showInstruction)
                            .padding(.horizontal)
                    }
                    else if (gameOver){
                        CardView(topic: "Game Over", explanation: "You get the high score of \(viewModel.score). Not Bad!", exitText: "Let's see what I missed", controlVariable: $changeView)
                            .onAppear {
                                BackgroundMusicManager.shared.playMusic(musicNumber: 1)
                            }
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
                                    .background {
                                        RoundedRectangle(cornerRadius: 17)
                                            .stroke(Color.tomatoRed, lineWidth: 7)
                                            .background(Color.white)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 17))
                                    .padding()
                                
                                Text("\(Image(systemName: "heart.fill")) \(viewModel.lifePoint)")
                                    .font(.system(size: 40))
                                    .bold()
                                    .foregroundColor(Color.tomatoRed)
                                    .padding()
                                    .padding(.horizontal)
                                    .background {
                                        RoundedRectangle(cornerRadius: 17)
                                            .stroke(Color.tomatoRed, lineWidth: 7)
                                            .background(Color.white)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 17))
                                Spacer()
                                InstructionView(text:"Tap all of the threats of smoothie shop!")
                                    .padding()
                            }
                            Spacer()
                            TowerDefenceGameView(viewModel: viewModel, gameOver: $gameOver)
                                .frame(width: 1000, height: 700)
                                .onReceive(timer) {  _ in
                                    if (time > 0) {
                                        time -= 1
                                    } else {
                                        gameOver = true
                                        timer.upstream.connect().cancel()
                                    }
                                }
                                .onAppear {
                                    BackgroundMusicManager.shared.stopMusic()
                                }
                            Spacer()
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
