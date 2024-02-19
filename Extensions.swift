//
//  Extensions.swift
//  Swothie
//
//  Created by Passavee Losripat on 12/2/2567 BE.
//

import SwiftUI
import Foundation
import SpriteKit

extension Color {
    static let midnightBlue = Color(red: 25/255, green: 25/255, blue: 112/255)
    static let tomatoRed = Color(red: 255/255, green: 99/255, blue: 71/255)
    static let bluePastel = Color(red: 123/255, green: 211/255, blue: 234/255)
}

extension CGPoint {
  func length() -> CGFloat {
    return sqrt(x*x + y*y)
  }
  
  func normalized() -> CGPoint {
    return self / length()
  }
}
