//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import SwiftUI

struct PlantTowerEnemyView: View {
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
    PlantTowerEnemyView(sign: otStructure(message: "Fluctuating Fruit Prices", isThreat: true), imageName: "Avocado")
}
