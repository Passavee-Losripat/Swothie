//
//  FunctionWhackTheMole.swift
//  Swothie
//
//  Created by Passavee Losripat on 14/2/2567 BE.
//

import Foundation

func randomFruit() -> String {
    let allFruit: [String] = ["Avocado", "Peach", "Mango"]
    return allFruit[Int.random(in: 0..<3)]
}

func randomSWData() -> swStructure {
    let amount = swData.count
    return swData[Int.random(in: 0..<amount)]
}

func randomMole () -> Int {
    return Int.random(in: 0..<9)
}
