//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import SwiftUI

struct EndingStoryView: View {
    @State private var dialogueIndex:Int = 0
    @State private var changeView:Bool = false
    let dialogueScript:[String] = ["Terrific! You have developed our smoothies village as well as defeated the enemies.", "My family has served the leaders for many generations. I can guarantee that you are the greatest of all time!", "That is all from me! If you encounter any issues, feel free to come back to me for advice!"]
    var body: some View {
        NavigationView {
            if (changeView){
                ContentView()
            }
            else{
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
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
    }
}

#Preview {
    EndingStoryView()
}
