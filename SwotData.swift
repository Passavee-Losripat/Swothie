//
//  SwotData.swift
//  Swothie
//
//  Created by Passavee Losripat on 14/2/2567 BE.
//

import Foundation

//Structure of Strengths and Threats Data
struct swStructure {
    var message: String
    var isWeakness: Bool
}

//Strengths and Threats Data
let swData: [swStructure] = [
    //Strength
    swStructure(message: "Use Fresh Fruit", isWeakness: false),
    swStructure(message: "Eco-freindly Package", isWeakness: false),
    swStructure(message: "Various Products", isWeakness: false),
    swStructure(message: "Sell online", isWeakness: false),
    //swStructure(message: "", isWeakness: false),
    
    //Weakness
    swStructure(message: "Limited Customers Group", isWeakness: true),
    swStructure(message: "Relied on Suppliers", isWeakness: true),
    swStructure(message: "Use many exotic fruits", isWeakness: true)
    //swStructure(message: "", isWeakness: true)
]

//Structure of Opportunities and Threats data
struct otStructure {
    var message: String
    var isThreat: Bool
}

//Opportunities and Threats data

let otData: [otStructure] = [
    //Opportunities
    otStructure(message: "", isThreat: false),
    otStructure(message: "", isThreat: false),
    
    //Threats
    otStructure(message: "", isThreat: true),
]
