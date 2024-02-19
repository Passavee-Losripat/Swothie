//
//  SWMissedView.swift
//  Swothie
//
//  Created by Passavee Losripat on 17/2/2567 BE.
//

import SwiftUI

struct SWMissedView: View {
    @State private var nextScene:Bool = false
    var description: [strengthWeaknessDescription] = swDescription
    var body: some View {
        ZStack {
            Image("swordScene")
                .resizable()
                .scaledToFill()
            if (nextScene) {
                PreTowerDefenceView()
            }
            else{
                VStack {
                    InstructionView(text: "Tap to see the explantions of each strengths and weakness")
                        .padding()
                    Spacer()
                    VStack(spacing: 20) {
                                ForEach(0..<2) { rowIndex in
                                    HStack(spacing: 20) {
                                        ForEach(0..<5) { columnIndex in
                                            let index = rowIndex * 5 + columnIndex
                                            if index < description.count {
                                                SWOTCardView(text: description[index].sw, explanation: description[index].desc)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
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
