import SwiftUI

struct ContentView: View {
    @State private var creditIsOn = false
    @State private var textOffset: CGFloat = 600
    @State private var startOpacity:Double = 0
    @State private var creditOpacity:Double = 0
    var body: some View {
        ZStack{
            NavigationView {
                ZStack{
                    Image("startBackground")
                VStack {
                    Text("Swothie")
                        .font(.title)
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
                        PrimaryButton(text: "Start")
                            .opacity(self.startOpacity)
                    }
                    Button {
                        creditIsOn.toggle()
                    } label: {
                        PrimaryButton(text: "Credit")
                            .opacity(self.creditOpacity)
                    }
                }
            }
            }.navigationViewStyle(StackNavigationViewStyle())
            if creditIsOn {
                Rectangle()
            }
        }
    }
}
