import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                NavigationLink(destination: TestView()) {
                    Text("GO GO")
                        .foregroundColor(.blue)
                }.navigationBarHidden(true)
            }
        }
    }
}

struct TestView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This is the test")
            }.navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}
