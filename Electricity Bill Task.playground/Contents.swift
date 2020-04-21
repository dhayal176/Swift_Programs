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

enum BillType {
    case domestic
    case commercial

    enum domesticTariff: Float {
        case serviceCharge = 50
        case hundredRange = 100, hundredMultiplier = 3.50
        case twoHundredRange = 200, twoHundredMultiplier = 4.60
        case fiveHundredRange = 500, fiveHundredMultiplier = 6.60
    }

    enum commercialTariff: Float {
        case serviceCharge = 290
        case belowHundredRange = 0, belowHundredMultiplier = 5.0
        case aboveHundredRange = 100, aboveHundredMultiplier = 6.60
    }
}

func unitCalculationForTwoMonths(startingRange: Int, endingRange: Int) -> Int {
    var unitForTwoMonths: Int = 0
    for _ in 1...60 {
        let unitPerDay = Int.random(in: startingRange...endingRange)
        unitForTwoMonths += unitPerDay
    }
    return unitForTwoMonths
}

func costCalculation(units: Int, tariffRange: Float, tariffMultiplier: Float) -> Float {
    let costValue = Float(Float(units) - tariffRange) * tariffMultiplier 
    return costValue
}

func domesticBillCalculation() -> Float{
    var billAmount: Float = 0
    let totalUnits = unitCalculationForTwoMonths(startingRange: 1, endingRange: 10)   
    print("The Reading for 2 months is \(totalUnits)")    
    let serviceCharge = BillType.domesticTariff.serviceCharge.rawValue
    let hundredRange = BillType.domesticTariff.hundredRange.rawValue, hundredMultiplier = BillType.domesticTariff.hundredMultiplier.rawValue
    let twoHundredRange = BillType.domesticTariff.twoHundredRange.rawValue, twoHundredMultiplier = BillType.domesticTariff.twoHundredMultiplier.rawValue
    let fiveHundredRange = BillType.domesticTariff.fiveHundredRange.rawValue, fiveHundredMultiplier = BillType.domesticTariff.fiveHundredMultiplier.rawValue
    let costForHundredUnits: Float = (hundredRange * hundredMultiplier)
    let costForThreeHundredUnits: Float = (300 * twoHundredMultiplier)
    if totalUnits >= Int(fiveHundredRange) {
        billAmount = costCalculation(units: totalUnits, tariffRange: fiveHundredRange, tariffMultiplier: fiveHundredMultiplier) + (costForThreeHundredUnits) + (costForHundredUnits)
    } else if totalUnits >= Int(twoHundredRange) {
        billAmount = costCalculation(units: totalUnits, tariffRange: twoHundredRange, tariffMultiplier: twoHundredMultiplier) + (costForHundredUnits)
    } else if totalUnits >= Int(hundredRange) {
        billAmount = costCalculation(units: totalUnits, tariffRange: hundredRange, tariffMultiplier: hundredMultiplier)
    }
    billAmount += serviceCharge
    return billAmount
}

func commercialBillCalculation() -> Float {
    var billAmount: Float = 0
    let totalUnits = unitCalculationForTwoMonths(startingRange: 10, endingRange: 100)
    print("The Reading for 2 months is \(totalUnits)")
    let serviceCharge = BillType.commercialTariff.serviceCharge.rawValue
    let belowHundredRange = BillType.commercialTariff.belowHundredRange.rawValue, belowHundredMultiplier = BillType.commercialTariff.belowHundredMultiplier.rawValue
    let aboveHundredRange = BillType.commercialTariff.belowHundredRange.rawValue, aboveHundredMultiplier = BillType.commercialTariff.aboveHundredMultiplier.rawValue
    let costForHundredUnits: Float = (belowHundredRange * belowHundredMultiplier)    
    if totalUnits >= Int(aboveHundredRange) {
        billAmount = costCalculation(units: totalUnits, tariffRange: aboveHundredRange, tariffMultiplier: aboveHundredMultiplier) + (costForHundredUnits)
    } else {
        billAmount = costCalculation(units: totalUnits, tariffRange: belowHundredRange, tariffMultiplier: belowHundredMultiplier)
    }
    billAmount += serviceCharge
    return billAmount
}

let billType = BillType.domestic
switch billType {
    case .domestic:
        print("Calculating Bill for Domestic")
        let calculatedBillAmount = domesticBillCalculation()
        print("The Bill is \(calculatedBillAmount)")
    case .commercial:
        print("Calculating Bill for Commercial")
        let calculatedBillAmount = commercialBillCalculation()
        print("The Bill is \(calculatedBillAmount)")
}