//
//  SwiftUIView.swift
//  
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import SwiftUI

struct SWOTCardView: View {
    var text:String
    var explanation:String
    @State private var closeExplainaiton:Bool = false
    var body: some View {
        Text(text)
            .padding()
    }
}

struct SWOTCardView_Previews: PreviewProvider {
    @State static var controlVariable: Bool = false
    
    static var previews: some View {
        SWOTCardView(text: "Test", explanation: "This is test explaination")
    }
}
