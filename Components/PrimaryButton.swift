//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 11/2/2567 BE.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .padding(.horizontal)
            .overlay(RoundedRectangle(cornerRadius: 17)
                .stroke(Color.green, lineWidth: 3)
            )
        
        
    }
}

#Preview {
    PrimaryButton(text: "test")
}
