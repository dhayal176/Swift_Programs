import Foundation

var inputExpression = "((12 + 23.4) + 4 + (5.54 - 6))"
let tempArrayForOperators = inputExpression.replacingOccurrences(of: " ", with: "", options: .regularExpression, range: nil)
let tempArray = tempArrayForOperators.replacingOccurrences(of: "[+-]", with: "()", options: .regularExpression, range: nil)
let symbolArray = ["+", "-", "/", "*","(",")"]
var postfixArray: [String] = []

var characterSet = CharacterSet.decimalDigits
characterSet.insert(charactersIn: ".")

var infixArray = tempArray.components(separatedBy: characterSet.inverted)
let symbolExpression = tempArrayForOperators.replacingOccurrences(of:"[0123456789.]", with: "", options: .regularExpression, range: nil)
let symbolsInInput = Array(symbolExpression)

for eachSymbol in 0..<symbolsInInput.count {
    for eachElement in 0..<infixArray.count {
        if infixArray[eachElement] == "" {
            infixArray[eachElement] = String(symbolsInInput[eachSymbol])
            break
        }
    }
}

func infixToPostfix() {
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
}

func resultCalculation() -> Double {
    var operandsArray: [Double] = []
    var symbolsBaseValueDictionary = ["*" : 1.0, "/": 1.0, "+": 0.0, "-": 0.0]
    for eachElement in postfixArray {
        if (symbolArray.contains(String(eachElement)) ) {
            if operandsArray.count == 1 {
                operandsArray.append(calculateArithmeticOperation(operator: eachElement, secondOperand: operandsArray.removeLast(), firstOperand: symbolsBaseValueDictionary[eachElement]!))
            } else {
                operandsArray.append(calculateArithmeticOperation(operator: eachElement, secondOperand: operandsArray.removeLast(), firstOperand: operandsArray.removeLast()))
            }      
        } else {
            operandsArray.append(Double(String(eachElement)) ?? 0)
        }
    }
   return operandsArray.removeLast()
}

func calculateArithmeticOperation(operator: String, secondOperand: Double, firstOperand: Double) -> Double {
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
print("The Answer for \(inputExpression) is: \(resultCalculation())")