//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import SwiftUI

struct PlantTowerView: View {
    var sign = randomSWData()
    var imageName = randomFruit()
    var body: some View {
        Group {
            ButtonText(text: sign.message, size: 20)
            Image(imageName)
                .resizable()
                .frame(maxWidth: 150, maxHeight: 150)
                .onAppear()
        }
    }
}

#Preview {
    PlantTowerView()
}
