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

    func selectionSort(array: inout [Int], size: Int) -> [Int] {
        var minimumValue: Int
        var numberOfSwaps = 0
        for range in 0..<size - 1 {
            minimumValue = range
            for element in range + 1..<size {
                if array[element] < array[minimumValue] {
                    minimumValue = element
                }
            }
            if array[minimumValue] != array[range] {
                let temp = array[minimumValue]
                array[minimumValue] = array[range]
                array[range] = temp
                numberOfSwaps += 1
            }
        }
        print("The Number of Swaps Required for Sorting is \(numberOfSwaps)")
        return array
    }

    func resultCalculation(array: [Int], index: inout Int) -> Int {
        var result = 0
        while index != 0 {
            result += array[index] - array[index - 1]
            index -= 1
        }
        return result
    }
}

var array = ArrayDetails(sizeOfTheArray: 6, integerArray: [2, 7, 4, 11, 30, 22], index: 3)
let sortedArray = array.selectionSort(array: &array.integerArray, size: array.sizeOfTheArray)
let result = array.resultCalculation(array: sortedArray, index: &array.index)
print("The Sorted Array is \(sortedArray)")
print("The Calculated Result is \(result)")