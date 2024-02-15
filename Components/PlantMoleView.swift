//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct PlantMoleView: View {
    @State var sign: swStructure = swStructure(message: "", isWeakness: true)
    @State var imageName:String = ""
    @State private var opacity:Double = 0
    @State private var offset:CGFloat = 500
    @State var showTime: Int = 5
    @State var rageMode:Bool
    @Binding var hasMole: Bool
    
    let plantTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                .onReceive(plantTimer, perform: { _ in
                    if (showTime>0) {
                        if (rageMode) {
                            showTime -= 2
                        }
                        else {
                            showTime -= 1
                        }
                    } else {
                        plantTimer.upstream.connect().cancel()
                        hasMole  = false
                    }
                })
                .onAppear {
                sign = randomSWData()
                imageName = randomFruit()
                    withAnimation(.easeOut(duration: 0.3)){
                        self.opacity = 1
                        self.offset = 0
                    }
                }
                .onDisappear {
                    plantTimer.upstream.connect().cancel()
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
            PlantMoleView(rageMode: true, hasMole: $hasMole)
        }
    }
}

struct MoleView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
}
