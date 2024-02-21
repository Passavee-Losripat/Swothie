import SwiftUI

struct ContentView: View {
    @State private var creditIsOn = false
    @State private var textOffset: CGFloat = 600
    @State private var startOpacity:Double = 0
    @State private var creditOpacity:Double = 0
    
    //Put Credit Text here so it's easily edited
    var creditText = "This game is created by Passavee Losripat.\n ALl of the visual is created by Passavee Losripat\n The music used in this app can be obtained as below.\n Music that can be used commercially without contribution (Creative Commons CC0 Public Domain): \n-1758: https://www.chosic.com/free-music/all/\n -Level 0: Music: https://www.chosic.com/free-music/all/\n Music that can be used commercially with credits (Creative Commons CC BY 3.0): -Epic Song by BoxCat Games | https://freemusicarchive.org/music/BoxCat_Games\n Music promoted by https://www.chosic.com/free-music/all/\n Creative Commons CC BY 3.0\n https://creativecommons.org/licenses/by/3.0/\n Thank you so much for playing this game!"
    
    var body: some View {
        ZStack{
            NavigationView {
                ZStack{
                    Image("startBackground")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
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
