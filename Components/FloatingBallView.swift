//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct FloatingBallView: View {
    var character:String
    var color:Color
    var body: some View {
        ZStack {
            Text(character)
                .font(.system(size: 250))
                .bold()
                .foregroundColor(Color.white)
                .padding()
                .padding()
                .background(
                Circle()
                    .frame(width: 250)
                    .foregroundColor(color)
            )
        }
    }
}

#Preview {
    FloatingBallView(character: "T", color: Color.tomatoRed)
}
