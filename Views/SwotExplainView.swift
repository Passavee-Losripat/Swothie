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
    let dialogueScript = ["Leader, This is Swot Sword, the most powerful weapon of our village. In order to master it, you need to master swot analysis.", "Swot analysis is a framework used to analyze situation by assessing both internal and external factors.", "Swot analysis is applicable in project planning and in business. Of course it can be used to improve our smoothie village!", "The swot sword will give knowledge to the worthy one. Now touch the sword and see if you are worthy!", "Now you know about swot analysis. Let's see if you can spot strength and weakness of our smoothie village!"]
    var body: some View {
        if (changeView){
            WhackTheMoleView()
        }
        else {
        NavigationView{
            ZStack {
                Image("swordScene")
                    .resizable()
                    .scaledToFill()
                if(swotExplain){
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
                    if (showStrength) {
                        CardView(topic: "S - Strength", explanation: "Strength refers to what you are good at. For example, the muscle is the strength of body builder.💪", exitText: "Got it!", controlVariable: $showStrength)
                    }
                    else if (showWeakness) {
                        CardView(topic: "W - Weakness", explanation: "Weakness refers to what you have to improve. For example, talking in front of people may be a weakness for shy people.🤒", exitText: "Got it!", controlVariable: $showWeakness)
                    }
                    else if (showOppportunity){
                        CardView(topic: "O - Opportunity", explanation: "Opportunity refers to the external situation that may give advantage to our organization. For example, new year season give you some time to rest and stay with your family.🤩", exitText: "Got it!", controlVariable: $showOppportunity)
                    }
                    else if (showThreat){
                        CardView(topic: "T - Threat", explanation: "Threat refers to the external situation that may harm our organization., For example, the rainy season may prevent us from going outside.😭", exitText: "Got it!", controlVariable: $showThreat)
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
