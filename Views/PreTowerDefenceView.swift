//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import SwiftUI

struct PreTowerDefenceView: View {
    @State var dialogueIndex:Int = 0
    @State var changeView:Bool = false
    let dialogueScript = ["Good job, my leader! Now you know about strengths and weakness, two key elements of SWOT.", "Oh no! it looks like the enemy smoothie village is invading us! And the allies are approaching at the same time!", "Now you have to protect our village and learn about opportunities and threats!"]
    var body: some View {
            if (changeView) {
                TowerDefenseView()
            }
            else {
                ZStack{
                    Image("smoothieVillageScene")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    DialogueBoxView(speaker: "Carrot", dialogue: dialogueScript[dialogueIndex], picture: "Carrot", maxSize: 100)
                        .padding(.horizontal)
                        .padding()
                }
                .onTapGesture {
                    if (dialogueIndex == 2) {
                        changeView = true
                        dialogueIndex = 0
                    }
                    dialogueIndex += 1
                }
            }
    }
}

#Preview {
    PreTowerDefenceView()
}
