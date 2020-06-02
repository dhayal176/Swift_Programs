/*Problem Statement : Array size, elements and a index value less than array size is given.
                        Sort the given array with minimum number of swaps.
                        Calculate the result by adding the diference between array of index and its previous index value till it reaches initial value of array.
                        At last print result value.
*/
import Foundation

struct ArrayDetails {
    let sizeOfTheArray: Int
    var integerArray: [Int]
    var index: Int

    func performSelectionSort(for integerArray: inout [Int], with size: Int) -> [Int] {
        var minimumValue: Int
        var numberOfSwaps = 0
        for range in 0..<size - 1 {
            minimumValue = range
            for element in range + 1..<size {
                if integerArray[element] < integerArray[minimumValue] {
                    minimumValue = element
                }
            }
            if integerArray[minimumValue] != integerArray[range] {
                let tempSwap = integerArray[minimumValue]
                integerArray[minimumValue] = integerArray[range]
                integerArray[range] = tempSwap
                numberOfSwaps += 1
            }
        }
        print("The Number of Swaps Required for Sorting is \(numberOfSwaps)")
        return integerArray
    }

    func calulateSumOfIndexValueForSortedArray(till index: inout Int) -> Int {
        var sumOfIndexValue = 0
        while index != 0 {
            sumOfIndexValue += integerArray[index] - integerArray[index - 1]
            index -= 1
        }
        return sumOfIndexValue
    }
}

var array = ArrayDetails(sizeOfTheArray: 6, integerArray: [2, 7, 4, 11, 30, 22], index: 3)
let sortedArray = array.performSelectionSort(for: &array.integerArray, with: array.sizeOfTheArray)
let sumOfIndexValue = array.calulateSumOfIndexValueForSortedArray(till: &array.index)
print("The Sorted Array is \(sortedArray)")
print("The Calculated Result is \(sumOfIndexValue)")