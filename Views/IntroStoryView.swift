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
    let dialogueScript = ["Welcome, our new Swothie Village Head! I am Carrot MMXXIV, your advisor. Just call me Carrot!", "With the knowledge passed down from 2023 generations of carrot advisors, I will aid you in becoming the best village head!", "Here at Swothie Village, we work towards making SWOTHIE the greatest smoothie business in the world!", "Your role as our village head is to improve our smoothies and protect our village from enemies.", "However, you must first learn to use our heirloom weapon, the SWOT Sword. It is the most powerful weapon in the village!"]
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
                if (dialogueIndex == 4) {
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
