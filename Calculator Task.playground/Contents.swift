/*Problem Statement : Create a simple calculator to accept the input expression as a string.
                      The result is calculated based on operator precedence.
                      Eg: (1+2)*(3-2)+4
                          =3*1+4
                          =3+4
                          =7     
*/

import Foundation

let inputExpression = "((12 / 23.4) * 4 + (5.54 - 6))"

func calculateAnswer(for input: String) -> Double {
    let symbolArray = ["+", "-", "/", "*","(",")"]
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
        var postfixArray: [String] = []
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

    func calculateResult(for postfixExpression: [String]) -> Double {
        var operandsArray: [Double] = []
        let operatorDictionary = ["*" : 1.0, "/": 1.0, "+": 0.0, "-": 0.0]
        for eachElement in postfixExpression {
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

    let infixExpression = createInfixExpression(for: input)
    let postfixExpression = changeInfixToPostfix(for: infixExpression)
    return calculateResult(for: postfixExpression)
}
let result = calculateAnswer(for: inputExpression)
print("The Answer for \(inputExpression) is: \(result)")