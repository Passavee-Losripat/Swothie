//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import SwiftUI

struct SWOTCardView: View {
    var text:String
    var explanation:String
    @State private var isFlipped:Bool = false
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(20)
                .frame(maxWidth: 200, maxHeight: 300)
                .foregroundColor(isFlipped ? .blue : .tomatoRed)
            if (isFlipped) {
                    Text(explanation)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .frame(maxWidth: 200, maxHeight: 300)
                        .minimumScaleFactor(0.5)
                        .lineLimit(nil)
                        .padding()
                        .padding(.horizontal)
            } else {
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .frame(maxWidth: 200, maxHeight: 300)
                    .padding()
            }
        }
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}

#Preview {
    SWOTCardView(text: "Test", explanation: "This is test explaination. For long text, the size of characeter should be decreased by 50%. Check for the readability and the others.")
}
