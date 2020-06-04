import Foundation

var input = "((12 / 23.4) * 4 + (5.54 - 6))"

let symbolArray = ["+", "-", "/", "*","(",")"]
var postfixArray: [String] = []

func createInfixExpression(for inputExpression: String) -> [String] {
    let tempArray = inputExpression.replacingOccurrences(of: " ", with: "", options: .regularExpression, range: nil)
    let tempArrayForInfixArray = tempArray.replacingOccurrences(of: "[*/+-]", with: "()", options: .regularExpression, range: nil)
    var calculatorCharacterSet = CharacterSet.decimalDigits
    calculatorCharacterSet.insert(charactersIn: ".")
    var infixArray = tempArrayForInfixArray.components(separatedBy: calculatorCharacterSet.inverted)
    let symbolExpression = tempArray.replacingOccurrences(of:"[0123456789.]", with: "", options: .regularExpression, range: nil)
    let symbolsInInput = Array(symbolExpression)
    
    for eachSymbol in 0..<symbolsInInput.count {
        for eachElement in 0..<infixArray.count {
            if infixArray[eachElement] == "" {
                infixArray[eachElement] = String(symbolsInInput[eachSymbol])
                break
            }
        }
    }
    return infixArray
}

func changeInfixToPostfix(for infixArray: [String]) -> [String] {
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

func calculateResult() -> Double {
    
    var operandsArray: [Double] = []
    var operatorDictionary = ["*" : 1.0, "/": 1.0, "+": 0.0, "-": 0.0]
    for eachElement in postfixArray {
        if (symbolArray.contains(String(eachElement)) ) {
            if operandsArray.count == 1 {
                operandsArray.append(performArithmeticOperation(operator: eachElement, secondOperand: operandsArray.removeLast(), firstOperand: operatorDictionary[eachElement]!))
            } else {
                operandsArray.append(performArithmeticOperation(operator: eachElement, secondOperand: operandsArray.removeLast(), firstOperand: operandsArray.removeLast()))
            }      
        } else {
            operandsArray.append(Double(String(eachElement)) ?? 0)
        }
    }
   return operandsArray.removeLast()
}

func performArithmeticOperation(operator: String, secondOperand: Double, firstOperand: Double) -> Double {
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

var infixExpression = createInfixExpression(for: input)
var postfixExpression = changeInfixToPostfix(for: infixExpression)
print("The Answer for \(input) is: \(calculateResult())")