//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 13/2/2567 BE.
//

import SwiftUI

struct DialogueBoxView: View {
    var speaker:String
    var dialogue:String
    var picture:String
    var maxSize:CGFloat
    var body: some View {
        VStack{
            Spacer()
            HStack{
                VStack{
                    Spacer()
                    Text(speaker)
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(Color.midnightBlue)
                        .padding()
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .frame(alignment: .leading)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 17)
                                        .stroke(Color.midnightBlue, lineWidth: 7)

                        )
                        .clipShape(RoundedRectangle(cornerRadius: 17))
                }
                Spacer()
                VStack{
                    Spacer()
                    Image(picture)
                        .resizable()
                        .frame(maxWidth: 400, maxHeight: 500)
                }
            }
                .padding(10)
            Text(dialogue)
                .font(.system(size: 40))
                .foregroundColor(Color.midnightBlue)
                .padding()
                .padding(.bottom)
                .padding(.top)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                            RoundedRectangle(cornerRadius: 17)
                                .stroke(Color.midnightBlue, lineWidth: 7)
                                .background(Color.white)
                                .frame(maxHeight: maxSize)
                )
                .clipShape(RoundedRectangle(cornerRadius: 17))
        }
    }
}

#Preview {
    DialogueBoxView(speaker: "Carrot", dialogue: "Hey yo test test", picture: "Carrot", maxSize: 65)
}
