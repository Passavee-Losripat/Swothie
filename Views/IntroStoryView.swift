//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 11/2/2567 BE.
//

import SwiftUI

struct IntroStoryView: View {
    @State var dialogueIndex:Int = 0
    @State var endOfIntro:Bool = false
    let dialogueScript = ["Hi! Welcome to Smoothie Village, where we aim to produce the greatest smoothie business in the world!", "You must be the new leader. I am your freindly villager, carrot. I will help you to be the best Smoothie village leader!", "As a leader, you have to improve our smoothie and protect our village from the enemy.", "But before doing that you must learn to use our inherited weapon, SWOT sword first."]
    var body: some View {
        if endOfIntro {
            SwotExplainView()
        }
        else {
        NavigationView {
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
                if (dialogueIndex == 3) {
                    endOfIntro = true
                    dialogueIndex = 0
                }
                dialogueIndex += 1
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
    }
    }
}

#Preview {
    IntroStoryView()
}
