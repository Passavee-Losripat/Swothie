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
    swStructure(message: "Limited Customers Group", isWeakness: true),
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
    otStructure(message: "Fluctuating Fruit Prices", isThreat: true),
    otStructure(message: "Rising Rental Cost", isThreat: true),
    otStructure(message: "Economic Downturns", isThreat: true),
    otStructure(message: "Changing Consumer Trend", isThreat: true),
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
    strengthWeaknessDescription(sw: "Use Fresh Fruit", desc: "Fresh fruits make smoothie more delicious! Customer will return to buy us again."),
    strengthWeaknessDescription(sw: "Eco-friendly Package", desc: "People now are concerned with how our business impacts the world. Sustainable practices like using eco-friendly packaging can attract more customers and make us outstanding!"),
    strengthWeaknessDescription(sw: "Variety of Products", desc: "Having many options can attract a variety of customers with different preferences and encourage customers to return for other smoothies!😆"),
    strengthWeaknessDescription(sw: "Sell online", desc: "Having an online option can make me reach more customers and accommodate customers."),
    strengthWeaknessDescription(sw: "Seasonal Menu Offering", desc: "Having seasonal menus can increase the value of our smoothies so the customers will buy smoothies from us more often!"),
    
    //weakness
    strengthWeaknessDescription(sw: "Limited Customers Group", desc: "Smoothies are likely to be interested by a small amount of customers: the one who loves smoothie and healthy lifestyle. So we may have less customers."),
    strengthWeaknessDescription(sw: "Relied on Suppliers", desc: "Ingredients like fruits are relied on the farmers. So we cannot control the price and the quality of the fruits."),
    strengthWeaknessDescription(sw: "Many Exotic Fruits Usage", desc: "Using a lot of exotic fruits can increase ingredients' price and may cause a shortage of ingredients."),
    strengthWeaknessDescription(sw: "Limited Operating Hours", desc: "Limited operating hours may result in limited time of selling our smoothies"),
    strengthWeaknessDescription(sw: "High Labor Costs", desc: "As SWOTHIE expands, the number of employees required increases, pushing the cost of production up."),
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
    opportunitiesThreatsDescription(ot: "Healthy life trend", desc: "Healthy life trend can increase our customers as people want to drink smoothies and get healthy💪!"),
    opportunitiesThreatsDescription(ot: "Delivery Services", desc: "Delivery services platform may open new option for customer who is difficult to go to our smoothies village."),
    opportunitiesThreatsDescription(ot: "Interested Investors", desc: "Investors can give money to us for expansion and marketing! This may increase our smoothie village growth."),
    opportunitiesThreatsDescription(ot: "Franchise Expansion", desc: "Franchise store can increase our income without our direct management."),
    
    //Threats
    opportunitiesThreatsDescription(ot: "Fluctuating Fruit Prices", desc: "Fruits are the main ingredients of the smoothies. The fluctuating fruit may make the cost to make smoothie higher."),
    opportunitiesThreatsDescription(ot: "Rising Rental Cost", desc: "Rising rental cost directly increases our smoothies shop expenditure. We will have less profit if the rental cost keep rising!"),
    opportunitiesThreatsDescription(ot: "Economic Downturns", desc: "Economics downturns make people want to spend less money. So we may have less customers than usual."),
    opportunitiesThreatsDescription(ot: "Changing Consumer Trend", desc: "Changing consumer trend requires us to change our selling strategies. It can increase our expends."),
    opportunitiesThreatsDescription(ot: "Having more opponents stores", desc: "Competitors can \"snatch\" our customers through lower prices or more appealing drinks!😡")
]
