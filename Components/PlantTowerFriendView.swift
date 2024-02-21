//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 20/2/2567 BE.
//

import SwiftUI

struct PlantTowerFriendView: View {
    var sign: otStructure
    var imageName:String
    var body: some View {
        Group {
            ButtonText(text: sign.message, size: 20)
            Image(imageName)
                .resizable()
                .frame(maxWidth: 150, maxHeight: 150)
        }
    }
}

#Preview {
    PlantTowerFriendView(sign: otStructure(message: "Cheaper Fruits", isThreat: false), imageName: "Avocado")
}
