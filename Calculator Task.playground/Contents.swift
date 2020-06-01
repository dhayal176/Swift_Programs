import Foundation

var inputExpression = "((2 + 3) * 4 + (5 - 6)) / 7"
let tempArray = inputExpression.replacingOccurrences(of: " ", with: "", options: .regularExpression, range: nil)
let symbolArray = ["+", "-", "/", "*","(",")"]
var infixArray = tempArray.map(String.init) // Not correct. Working on other ways.
var postfixArray: [String] = []

func infixToPostfix() -> [String] {
    let orderOfPrecedence = ["+": 1, "-": 1, "*": 2, "/": 2, "(": 0]
    var operatorArray: [String] = []
    for eachElement in infixArray {
        if symbolArray.contains(eachElement) != true {
            postfixArray.append(eachElement)
        } else if eachElement == "(" {
            operatorArray.append(eachElement)
        } else if eachElement == ")" {  
            var removeOperators = operatorArray.removeLast()
            while removeOperators != "("{
                postfixArray.append(removeOperators)
                removeOperators = operatorArray.removeLast()
            }
        } else {
            while !operatorArray.isEmpty  && orderOfPrecedence[eachElement]! <= orderOfPrecedence[operatorArray.last!]! {
                postfixArray.append(operatorArray.removeLast())  
            }
            operatorArray.append(eachElement)
        }
    }
    while !operatorArray.isEmpty {
        postfixArray.append(operatorArray.removeLast())
    }
    return postfixArray
}

func resultCalculation() -> Double {
    var operandsArray: [Double] = []
    var symbolsBaseValueDictionary = ["*" : 1.0, "/": 1.0, "+": 0.0, "-": 0.0]
    for eachElement in postfixArray {
        if (symbolArray.contains(String(eachElement)) ) {
            if operandsArray.count == 1 {
                operandsArray.append(calculateArithmeticOperation(`operator`: eachElement, secondOperand: operandsArray.removeLast(), firstOperand: symbolsBaseValueDictionary[eachElement]!))
            } else {
                operandsArray.append(calculateArithmeticOperation(`operator`: eachElement, secondOperand: operandsArray.removeLast(), firstOperand: operandsArray.removeLast()))
            }      
        } else {
            operandsArray.append(Double(String(eachElement)) ?? 0)
        }
    }
   return operandsArray.removeLast()
}

func calculateArithmeticOperation(`operator`: String, secondOperand: Double, firstOperand: Double) -> Double {
    switch `operator` {
    case "+":
        return firstOperand + secondOperand
    case "-":
        return firstOperand - secondOperand
    case "*":
        return firstOperand * secondOperand
    case "/":
        return firstOperand / secondOperand
    default:
        return 0
    }
}

infixToPostfix()
print("The Answer is: \(resultCalculation()) " )