//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 20/2/2567 BE.
//

import SwiftUI

struct PlantTowerFriendView: View {
    var sign = randomOpportunityData()
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
    PlantTowerFriendView()
}
