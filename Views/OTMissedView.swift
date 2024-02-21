//
//  OTMissedView.swift
//  Swothie
//
//  Created by Passavee Losripat on 17/2/2567 BE.
//

import SwiftUI

struct OTMissedView: View {
    @State private var nextScene:Bool = false
    var description: [opportunitiesThreatsDescription] = otDescription
    var body: some View {
        ZStack {
            Image("swordScene")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            if (nextScene) {
                EndingStoryView()
            }
            else{
                VStack {
                    InstructionView(text: "Tap to see the explantions of each opportunities and threats")
                        .padding()
                    Spacer()
                    ForEach(0..<2){ rowIndex in
                        HStack {
                            ForEach(0..<5) { columnIndex in
                                let index = rowIndex * 5 + columnIndex
                                if index < description.count {
                                    SWOTCardView(text: description[index].ot, explanation: description[index].desc)
                                }
                            }
                        }
                        
                    }
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
    OTMissedView()
}
