//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 12/2/2567 BE.
//

import SwiftUI

struct CardView: View {
    var topic:String
    var explanation:String
    var exitText:String
    @Binding var controlVariable:Bool
    var body: some View {
        VStack {
            Text(topic)
                .font(.system(size: 90))
                .bold()
                .foregroundColor(Color.tomatoRed)
            Text(explanation)
                .font(.system(size: 40))
                .padding(.bottom)
                .foregroundColor(Color.tomatoRed)
            Button {
                controlVariable.toggle()
            } label: {
                ButtonText(text: exitText, size: 40)
            }
        }
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .overlay(RoundedRectangle(cornerRadius: 17)
            .stroke(Color.tomatoRed, lineWidth: 7)
        )
    }
}

struct CardView_Previews: PreviewProvider {
    @State static var showVariable = false
    
    static var previews: some View {
        CardView(topic: "Test", explanation: "Bla Bla Bla", exitText: "Exit", controlVariable: $showVariable)
    }
}
