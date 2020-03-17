import Foundation

var alphabets = [String: Int]()
let input = """
abc
Ab
3./an
ab
abc
""".lowercased()
for each in input {
    var count = 0
    for eachAlphabet in input {    
        if each == eachAlphabet {
            count += 1
        }    
    }
    if each.isLetter {
        alphabets["\(each)"] = count
    }        
}
let sortedAlphabets = alphabets.sorted(by: <)    
print(sortedAlphabets)