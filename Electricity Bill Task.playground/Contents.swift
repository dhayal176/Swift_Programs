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

struct ElectricityBill {
    var serviceCharge: Float
    var rangeArray: [Float]
    var tariffArray: [Float]

    func unitCalculationForTwoMonths(startRange: Int, endRange: Int) -> Int {
        var unitForTwoMonths: Int = 0
        for _ in 1...60 {
            let unitPerDay = Int.random(in: startRange...endRange)
            unitForTwoMonths += unitPerDay
        }
        return unitForTwoMonths
    }

    func costCalculation(units: Int, tariffRange: Float, tariffMultiplier: Float) -> Float {
        let costValue = Float(Float(units) - tariffRange) * tariffMultiplier
        return costValue
    }

    func calculateAmountFor(balanceRange: Int) -> Float {
        var balanceAmount: [Float] = []    
        for range in 0...balanceRange {
            let difference: Float = rangeArray[range + 1] - rangeArray[range]
            balanceAmount.append(difference * tariffArray[range])
        }
        return balanceAmount.reduce(0, +)
    }

    func billCalculation(totalUnits: Int, serviceCharge: Float) -> Float {
        var billAmount: Float = 0
        print("The Reading for 2 months is \(totalUnits)")    
        var count = rangeArray.count - 1
        while count != -1 {
            if totalUnits >= Int(rangeArray[count]) {
                billAmount = costCalculation(units: totalUnits, tariffRange: rangeArray[count], tariffMultiplier: tariffArray[count]) + calculateAmountFor(balanceRange: count - 1)//balanceAmount.dropLast((rangeArray.count - 1) - (count)).reduce(0, +)
                break
            }           
            count -= 1
        }
        billAmount += serviceCharge
        return billAmount
    }
}

enum BillType {
    case domestic
    case commercial
}

let billType = BillType.domestic
switch billType {
    case .domestic:
        print("Calculating Bill for Domestic")
        var electricBill = ElectricityBill(serviceCharge: 50, rangeArray: [0, 100, 200, 500], tariffArray: [0, 3.50, 4.60, 6.60])
        let totalUnits = electricBill.unitCalculationForTwoMonths(startRange: 1, endRange: 10)
        let calculatedBillAmount = electricBill.billCalculation(totalUnits: totalUnits, serviceCharge: electricBill.serviceCharge)
        print("The Bill is \(calculatedBillAmount)")
    case .commercial:
        print("Calculating Bill for Commercial")
        var electricBill = ElectricityBill(serviceCharge: 290, rangeArray: [0, 100], tariffArray: [5.50, 6.60])
        let totalUnits = electricBill.unitCalculationForTwoMonths(startRange: 10, endRange: 100)
        let calculatedBillAmount = electricBill.billCalculation(totalUnits: totalUnits, serviceCharge: electricBill.serviceCharge)
        print("The Bill is \(calculatedBillAmount)")
}