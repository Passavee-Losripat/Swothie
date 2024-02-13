//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct PlantMoleView: View {
    var sign: swStructure = randomSWData()
    var imageName:String = randomFruit()
    @State private var opacity:Double = 0
    @State private var offset:CGFloat = 500
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
                //.offset(y: self.offset)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.3)){
                        self.opacity = 1
                        self.offset = 0
                    }
                }
                .onDisappear {
                    withAnimation(.easeOut(duration: 0.3)) {
                        self.offset = 500
                        self.opacity = 0
                    }
                }
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
            PlantMoleView(hasMole: $hasMole)
        }
    }
}

struct MoleView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
