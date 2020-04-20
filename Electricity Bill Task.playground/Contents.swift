/*Problem Statement : Need to calculate Electricity bill for every two months based on below tariffs.  
                        For domestic:
                                For first 100 units Rs 0/unit
                                For next 100 units Rs 3.50/unit
                                For next 300 units Rs 4.60/unit
                                For unit above 500  Rs 6.60/unit
                                Fixed charges for two months Rs.50/service
                        For Commercial:
                                For first 100 units Rs 5.00/unit
                                Consumption above 100 units bi monthly 8.05/unit
                                Fixed charges for two months Rs.290/service
                        Get random numbers as daily consumable units.
                            For domestic random number generation should be in between 1 - 10.
                            For commercial 10 - 100
*/

import Foundation

func unitCalculation(startingRange: Int, endingRange: Int) -> Int {
    var unitForTwoMonths: Int = 0
    for _ in 1...60 {
        let unitPerDay = Int.random(in: startingRange...endingRange)
        unitForTwoMonths += unitPerDay
    }
    return unitForTwoMonths
}

func billCalculation(units: Int, tariffRange: Int, tariffMultiplier: Float) -> Float {
    billAmount = Float(units - tariffRange) * tariffMultiplier 
    return billAmount
}

enum BillType: String {
    case domestic
    case commercial
}

var billAmount: Float = 0
let billType = BillType.domestic
if billType.rawValue == "domestic" {
    print("Calculating Bill for Domestic")
    let serviceCharge: Float = 50
    let totalUnits = unitCalculation(startingRange: 1, endingRange: 10)    
    print("The Reading for 2 months is \(totalUnits)")
    let amountForHunderedUnits: Float = (100 * 3.50)
    let amountForThreeHunderedUnits: Float = (300 * 4.60)
    if totalUnits > 500 {
        billAmount = billCalculation(units: totalUnits, tariffRange: 500, tariffMultiplier: 6.60) + (amountForThreeHunderedUnits) + (amountForHunderedUnits)
    } else if totalUnits > 200 {
        billAmount = billCalculation(units: totalUnits, tariffRange: 200, tariffMultiplier: 4.60) + (amountForHunderedUnits)
    } else if totalUnits > 100 {
        billAmount = billCalculation(units: totalUnits, tariffRange: 100, tariffMultiplier: 3.50)
    }
    billAmount += serviceCharge
    print("The Bill is \(billAmount)")
} else if billType.rawValue == "commercial" {
    print("Calculating Bill for Commercial")
    let serviceCharge: Float = 290
    let totalUnits = unitCalculation(startingRange: 10, endingRange: 100)
    print("The Reading for 2 months is \(totalUnits)")
    let amountForHunderedUnits: Float = (100 * 5.0)
    if totalUnits > 100 {
        billAmount = billCalculation(units: totalUnits, tariffRange: 100, tariffMultiplier: 6.60) + (amountForHunderedUnits)
    } else {
        billAmount = billCalculation(units: totalUnits, tariffRange: 0, tariffMultiplier: 5.0)
    }
    billAmount += serviceCharge
    print("The Bill is \(billAmount)")
}