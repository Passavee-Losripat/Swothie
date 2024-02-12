//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 11/2/2567 BE.
//

import SwiftUI

struct IntroStoryView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Image("smoothieVillageScene")
                    .resizable()
                    .scaledToFill()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        
        
    }
}

#Preview {
    IntroStoryView()
}
