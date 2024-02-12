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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        
        
    }
}

#Preview {
    IntroStoryView()
}
