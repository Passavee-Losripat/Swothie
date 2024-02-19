//
//  SWMissedView.swift
//  Swothie
//
//  Created by Passavee Losripat on 17/2/2567 BE.
//

import SwiftUI

struct SWMissedView: View {
    @State private var nextScene:Bool = false
    var body: some View {
        ZStack {
            Image("swordScene")
                .resizable()
                .scaledToFill()
            if (nextScene) {
                
            }
            else{
                VStack {
                    InstructionView(text: "Let's see the explaination of each weakness")
                        .padding()
                    Spacer()
                    FloatingBallView(character: "Test", color: Color.red)
                    Spacer()
                    HStack{
                        Spacer()
                        Button {
                            nextScene = true
                        } label: {
                            ButtonText(text: "I got it!", size: 50)
                        }
                        .padding()
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    SWMissedView()
}
