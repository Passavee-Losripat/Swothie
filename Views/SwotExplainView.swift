//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 12/2/2567 BE.
//

import SwiftUI

struct SwotExplainView: View {
    @State var showStrength:Bool = false
    @State var showWeakness:Bool = false
    @State var showOppportunity:Bool = false
    @State var showThreat:Bool = false
    @State var swotExplain:Bool = false
    @State var dialogueIndex:Int = 0
    @State var lastDialogue: Bool = false
    @State var changeView:Bool = false
    let dialogueScript = ["Leader, this is the heirloom SWOT Sword. In order to master it, you need to master SWOT analysis.", "SWOT analysis is a framework used to analyze a situation by assessing both internal and external factors.", "SWOT analysis can be used in project planning and in business. It is the secret behind our success in the past years!", "The SWOT sword will give knowledge to the worthy one. Now touch the sword and see if you are worthy!", "Now you know about SWOT analysis. Let's see if you can spot strength and weakness of our smoothie village!"]
    var body: some View {
        if (changeView){
            WhackTheMoleView()
        }
        else {
        NavigationView{
            ZStack {
                Image("swordScene")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                if(swotExplain){
                    VStack {
                        InstructionView(text: "You are worthy! Let's tap to see what each character is.")
                        HStack {
                            FloatingBallView(character: "S", color: Color.pink)
                                .padding()
                                .onTapGesture {
                                    showStrength.toggle()
                                }
                            FloatingBallView(character: "W", color: Color.pink)
                                .padding()
                                .onTapGesture {
                                    showWeakness.toggle()
                                }
                            FloatingBallView(character: "O", color: Color.pink)
                                .padding()
                                .onTapGesture {
                                    showOppportunity.toggle()
                                }
                            FloatingBallView(character: "T", color: Color.pink)
                                .padding()
                                .onTapGesture {
                                    showThreat.toggle()
                                }
                        }
                    }
                    if (showStrength) {
                        CardView(topic: "S - Strength", explanation: "Strength refers to what you are good at. For example, I can do coding all day.😎", exitText: "Got it!", controlVariable: $showStrength)
                            .padding(.horizontal)
                    }
                    else if (showWeakness) {
                        CardView(topic: "W - Weakness", explanation: "Weakness refers to what you have to improve. For example,For example, my art skill is so amateur.😭", exitText: "Got it!", controlVariable: $showWeakness)
                            .padding(.horizontal)
                    }
                    else if (showOppportunity){
                        CardView(topic: "O - Opportunity", explanation: "Opportunity refers to the external situation that may give advantage to our organization. For example, there will be a coding competition and I may win a prize.🥳", exitText: "Got it!", controlVariable: $showOppportunity)
                            .padding(.horizontal)
                    }
                    else if (showThreat){
                        CardView(topic: "T - Threat", explanation: "Threat refers to the external situation that may harm our organization. For example, my friend may ask me out so I cannot finish my work.😭", exitText: "Got it!", controlVariable: $showThreat)
                            .padding(.horizontal)
                    }
                        HStack{
                            Spacer()
                            VStack {
                                Spacer()
                                Button {
                                    swotExplain.toggle()
                                    dialogueIndex = 4
                                } label: {
                                    ButtonText(text: "I got it all", size: 50)
                                }
                                .padding(.horizontal)
                                .padding()
                            }
                        }
                }
                else {
                    Image("swotSword")
                        .resizable()
                        .frame(maxWidth: 800, maxHeight: 800)
                        .onTapGesture {
                            if (dialogueIndex == 3) {
                                swotExplain = true
                            }
                        }
                    DialogueBoxView(speaker: "Carrot", dialogue: dialogueScript[dialogueIndex], picture: "Carrot", maxSize: 95)
                        .padding(.horizontal)
                        .padding()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .onTapGesture {
            SoundEffectManager.shared.playSoundEffect(fileName: "clickSound", fileType: "wav")
            if (dialogueIndex < 3){
                dialogueIndex += 1
            }
            else if (lastDialogue){
                changeView.toggle()
            }
            else if (dialogueIndex == 4){
                lastDialogue = true
            }
        }
    }
    }
}

#Preview {
    SwotExplainView()
}
