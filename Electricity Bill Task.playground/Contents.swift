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

//var units: Double = 350
var billAmount: Float = 0
print("Enter a Choice")
print("1.Domestic 2.Commercial")
let choice = 1
if choice == 1 {
    print("Calculating Bill for Domestic")
    let serviceCharge: Float = 50
    var unitForTwoMonths: [Int] = []
    for index in 1...60 {
        let unitPerDay = Int.random(in: 1...10)
        unitForTwoMonths.append(unitPerDay)
    }
    let units = unitForTwoMonths.reduce(0, +)    
    print("The unit is \(units)")
    let amountForHunderedUnits: Float = (100 * 3.50)
    let amountForThreeHunderedUnits: Float = (300 * 4.60)
    if units >= 501 {
        billAmount = Float(units - 500) * 6.60 + (amountForThreeHunderedUnits) + (amountForHunderedUnits)
    } else if units >= 201 && units <= 500 {
        billAmount = Float(units - 200) * 4.60 + (amountForHunderedUnits)
    } else if units >= 101 && units <= 200 {
        billAmount = Float(units - 100) * 3.50
    }
    billAmount += serviceCharge
    print("The Bill is \(billAmount)")
} else if choice == 2 {
    print("Calculating Bill for Commercial")
    let serviceCharge: Float = 290
    var unitForTwoMonths: [Int] = []
    for index in 1...60 {
        let unitPerDay = Int.random(in: 10...100)
        unitForTwoMonths.append(unitPerDay)
    }    
    let units = unitForTwoMonths.reduce(0, +)
    print("The unit is \(units)")
    let amountForHunderedUnits: Float = (100 * 5.0)
    if units >= 101 {
        billAmount = Float(units - 100) * 6.60 + (amountForHunderedUnits)
    } else {
        billAmount = Float(units) * 5.0
    }
    billAmount += serviceCharge
    print("The Bill is \(billAmount)")
} else {
    print("Enter a Valid Choice")
}