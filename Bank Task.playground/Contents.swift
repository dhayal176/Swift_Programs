import Foundation

func simpleInterest (principal: Double, rate: Double, time: Double) {
    let simpleInterest = principal * (rate / 100) * (time / 12)
    print("Interest Paid at the End is: \(simpleInterest)")
    bankBalance += simpleInterest
    print("Bank Balance at the End is: \(bankBalance)")
}

func compoundInterest(principal: Double, rate: Double, time: Double) {
    let compoundInterest = principal * (pow((1 + rate / 100),(time / 12)))
    print("Interest Paid at the End is: \(compoundInterest)")
    bankBalance += compoundInterest
    print("Bank Balance at the End is: \(bankBalance)")
}

var bankBalance: Double = 1000000000
let loanAmount: Double = 2500000
let loanTenure: Double = 120 // in months
let rateOfInterest: Double = 14
print("Enter Your Choice")
print("1.Simple Interest 2.Compound Interest")
let choice = 1
if choice == 1 {
    print("Calculating Simple Interest")
    simpleInterest(principal: loanAmount, rate: rateOfInterest, time: loanTenure)
} else if choice == 2 {
    print("Calculating compound Interest")
    compoundInterest(principal: loanAmount, rate: rateOfInterest, time: loanTenure)
} else {
    print("Enter a Valid Choice")
}