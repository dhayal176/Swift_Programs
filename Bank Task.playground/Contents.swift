  
/*Problem Statement: There’s bank in the name of Ivy Bank. Bank’s Balance 100,00,00,000.
                     Person X has an account in Ivy Bank. His/her account number is XXXXXXXXXX.
                     And Person X taken a loan amount of 25,00,000 for an interest rate of 14% and the loan tenure is 120 months. 
                     Every month interest has to be recalculated from the principal amount. 
                     At the end of 120 month, how much interest will be paid by the Person X. 
                     Also at the end of 120 months what will be the Banks’s balance.
                     Calculate  both simple and compound interest.*/
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