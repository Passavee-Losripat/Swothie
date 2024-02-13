//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct PlantMoleView: View {
    var imageName: String
    var sign: swStructure
    @Binding var hasMole: Bool
    var body: some View {
        VStack {
            if (hasMole) {
                Group {
                    ButtonText(text: sign.message, size: 20)
                    Image(imageName)
                        .resizable()
                        .frame(maxWidth: 150, maxHeight: 150)
                        .onAppear()
                }
                .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .opacity))
            }
            Image("Pot")
                .resizable()
                .frame(maxWidth: 150, maxHeight: 150)
        }
    }
}

struct PreviewWrapper: View {
    @State private var hasMole: Bool = false

    var body: some View {
        VStack {
            Button("Toggle Mole") {
                hasMole.toggle()
            }
            Spacer()
            PlantMoleView(imageName: "Carrot", sign: swData[0], hasMole: $hasMole)
        }
    }
}

struct MoleView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
