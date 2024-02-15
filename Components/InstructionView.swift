//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 15/2/2567 BE.
//

import SwiftUI

struct InstructionView: View {
    var text:String
    var body: some View {
        Text(text)
            .padding()
            .font(.system(size: 35))
            .bold()
            .foregroundColor(Color.white)
            .background(Color.midnightBlue.opacity(0.7))
            .cornerRadius(20)
    }
}

#Preview {
    InstructionView(text: "Test")
}
