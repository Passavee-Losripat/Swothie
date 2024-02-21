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
                .foregroundColor(isFlipped ? Color.bluePastel : Color.midnightBlue)
            Group {
                if (isFlipped) {
                    Text(explanation)
                        .font(.system(size: 25))
                }
                else {
                    Text(text)
                        .bold()
                        .font(.system(size: 30))
                }
            }
            .foregroundColor(.white)
            .minimumScaleFactor(0.5)
            .lineLimit(nil)
            .frame(maxWidth: 180, maxHeight: 280)
            .padding()
        }
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .onTapGesture {
            withAnimation(.easeInOut) {
                            isFlipped.toggle()
            }
        }
    }
}

#Preview {
    SWOTCardView(text: "Test", explanation: "This is test explaination. For long text, the size of characeter should be decreased by 50%. Check for the readability and the others.")
}
