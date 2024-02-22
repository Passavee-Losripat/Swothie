//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 15/2/2567 BE.
//

import SwiftUI

struct MiddleNotification: View {
    var text:String
    @State private var notiTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var notiDuration:Int = 2
    @State private var show:Bool = true
    @State private var opacity:Double = 1
    var body: some View {
        if (show) {
            ZStack{
                Rectangle()
                    .foregroundColor(Color.tomatoRed)
                    .opacity(0.8)
                    .frame(width: .infinity, height: 150)
                Text(text)
                    .padding()
                    .font(.system(size: 90))
                    .bold()
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .opacity(opacity)
            .onDisappear {
                withAnimation(.easeOut(duration: 1)) {
                    opacity = 0
                }
            }
            .onReceive(notiTimer) { _ in
                if (notiDuration>0) {
                    notiDuration -= 1
                } else {
                    show.toggle()
                    notiTimer.upstream.connect().cancel()
                }
            }
        }
    }
}

#Preview {
    MiddleNotification(text: "Test")
}
