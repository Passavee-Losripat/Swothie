import SwiftUI

struct ContentView: View {
    @State private var creditIsOn = false
    @State private var textOffset: CGFloat = 600
    @State private var startOpacity:Double = 0
    @State private var creditOpacity:Double = 0
    
    //Put Credit Text here so it's easily edited
    var creditText = "This game is created by Passavee Losripat. The image is created using Procreate App, which mean it can be used commercially.\nThe background used in this game is from ..., under the license, all of the musics can be commercially used.\n The information in the game is obtained from ...."
    
    var body: some View {
        ZStack{
            NavigationView {
                ZStack{
                    Image("startBackground")
                VStack {
                    Image("swothieText")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 800, height: 400)
                        .offset(y: self.textOffset)
                        .onAppear {
                            withAnimation(.easeOut(duration: 2)){
                                self.textOffset = 0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    self.startOpacity = 1
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        self.creditOpacity = 1
                                    }
                                }
                            }
                        }
                    NavigationLink(destination: IntroStoryView()) {
                        ButtonText(text: "Start", size: 50)
                            .opacity(self.startOpacity)
                            .padding(10)
                    }
                    Button {
                        creditIsOn.toggle()
                    } label: {
                        ButtonText(text: "Credit", size: 50)
                            .opacity(self.creditOpacity)
                    }
                }
            }
            }.navigationViewStyle(StackNavigationViewStyle())
            if creditIsOn {
                CardView(topic: "CREDIT", explanation: creditText, exitText: "Back", controlVariable: $creditIsOn)
            }
        }
    }
}
