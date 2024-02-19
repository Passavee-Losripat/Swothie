//
//  FunctionTowerDefense.swift
//  Swothie
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import Foundation

func randomOTData() -> otStructure {
    let amount = otData.count
    return otData[Int.random(in: 0..<amount)]
}
