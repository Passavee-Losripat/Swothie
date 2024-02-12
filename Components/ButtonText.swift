//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 11/2/2567 BE.
//

import SwiftUI

struct ButtonText: View {
    var text: String
    var size: CGFloat
    var body: some View {
            Text(text)
                .font(.system(size: size))
                .bold()
                .foregroundColor(Color.tomatoRed)
                .padding()
                .padding(.horizontal)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 17)
                    .stroke(Color.tomatoRed, lineWidth: 7)
                )
    }
}

#Preview {
    ButtonText(text: "test", size: 40)
}
