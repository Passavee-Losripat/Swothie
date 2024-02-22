//
//  SwotData.swift
//  Swothie
//
//  Created by Passavee Losripat on 14/2/2567 BE.
//

import Foundation

//Structure of Strengths and Weakness Data
struct swStructure {
    var message: String
    var isWeakness: Bool
}

//Strengths and Weakness Data
let swData: [swStructure] = [
    //Strength
    swStructure(message: "Use Fresh Fruit", isWeakness: false),
    swStructure(message: "Eco-freindly Package", isWeakness: false),
    swStructure(message: "Variety of Products", isWeakness: false),
    swStructure(message: "Online Ordering", isWeakness: false),
    swStructure(message: "Seasonal Menu Offering", isWeakness: false),
    //swStructure(message: "", isWeakness: false),
    
    //Weakness
    swStructure(message: "Small Target Market", isWeakness: true),
    swStructure(message: "Relied on Suppliers", isWeakness: true),
    swStructure(message: "Many Exotic Fruits Usage", isWeakness: true),
    swStructure(message: "Limited Operating Hours", isWeakness: true),
    swStructure(message: "High Labor Costs", isWeakness: true)
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
    otStructure(message: "Cheaper Fruits", isThreat: false),
    otStructure(message: "Healthy life trend", isThreat: false),
    otStructure(message: "Delivery Services", isThreat: false),
    otStructure(message: "Interested Investors", isThreat: false),
    otStructure(message: "Franchise Expansion", isThreat: false),
    //otStructure(message: "", isThreat: false),
    
    //Threats
    otStructure(message: "Climate Change", isThreat: true),
    otStructure(message: "Rising Rental Cost", isThreat: true),
    otStructure(message: "Economic Downturns", isThreat: true),
    otStructure(message: "Negative Reviews", isThreat: true),
    otStructure(message: "Increasing Competition", isThreat: true),
    //otStructure(message: "", isThreat: true)
]

//Strengths and weakness description structure
struct strengthWeaknessDescription {
    var sw: String
    var desc: String
}

//All descriptions for strengths and weakness
let swDescription: [strengthWeaknessDescription] = [
    //strength
    strengthWeaknessDescription(sw: "Use Fresh Fruit", desc: "Fresh fruits make our smoothie more delicious!"),
    strengthWeaknessDescription(sw: "Eco-friendly Package", desc: " This can attract nature-lover customers and repute our brand"),
    strengthWeaknessDescription(sw: "Variety of Products", desc: "Cater to people with different taste preferences"),
    strengthWeaknessDescription(sw: "Sell online", desc: "We can reach our customers more than just offline!"),
    strengthWeaknessDescription(sw: "Seasonal Menu Offering", desc: "Increase our smoothie’s variety and uniqueness"),
    
    //weakness
    strengthWeaknessDescription(sw: "Small Target Market", desc: "Only smoothie lovers and health-conscious consumers will buy us.🥲"),
    strengthWeaknessDescription(sw: "Relied on Suppliers", desc: "We cannot control the price nor the quality of the fruits."),
    strengthWeaknessDescription(sw: "Many Exotic Fruits Usage", desc: "Exotic fruits usage may cause a shortage of ingredients and increase the cost."),
    strengthWeaknessDescription(sw: "Limited Operating Hours", desc: "Limited operating hours results in our smoothie selling time limitation"),
    strengthWeaknessDescription(sw: "High Labor Costs", desc: "Higher labor costs make our expenditure rise.🙀"),
]

//Oppportunities and Threats description structure
struct opportunitiesThreatsDescription {
    var ot: String
    var desc: String
}

//All descriptions for strengths and weakness

let otDescription: [opportunitiesThreatsDescription] = [
    //Opportunities
    opportunitiesThreatsDescription(ot: "Cheaper Fruits", desc: "Cheaper fruits make the cost to make smoothies lower."),
    opportunitiesThreatsDescription(ot: "Healthy life trend", desc: "This might result in people switching to healthy smoothies!💪"),
    opportunitiesThreatsDescription(ot: "Delivery Services", desc: "Now we can sell smoothies direct to your door!"),
    opportunitiesThreatsDescription(ot: "Interested Investors", desc: "We can get invested for our smoothie village expansion.🤠"),
    opportunitiesThreatsDescription(ot: "Franchise Expansion", desc: "Allows increase in revenue without direct management.💸"),
    
    //Threats
    opportunitiesThreatsDescription(ot: "Climate Change", desc: "Climate Change may cause a shortage of fresh fruits."),
    opportunitiesThreatsDescription(ot: "Rising Rental Cost", desc: "Rising rental cost will reduce our profits."),
    opportunitiesThreatsDescription(ot: "Economic Downturns", desc: "People will buy smoothies less during the crisis."),
    opportunitiesThreatsDescription(ot: "Negative Reviews", desc: "Negative reviews will disrepute our smoothies."),
    opportunitiesThreatsDescription(ot: "Having more opponents stores", desc: "Competitors can \"snatch\" our customers!😡")
]
