/*Problem Statement: Taking Order Count and providing the product batch wise.
                     If order is greater that available products then say out of stock*/

import Foundation

var orderCount =  113, totalCount = 0
var `case` = 50, outer = 5, piece = 1
var batches = [["Name": "Batch1", "Avail": 50, "Case": 0, "Outer": 0, "Piece": 0],
               ["Name": "Batch2", "Avail": 25, "Case": 0, "Outer": 0, "Piece": 0],
               ["Name": "Batch3", "Avail": 125, "Case": 0, "Outer": 0, "Piece": 0]]
for batch in batches {
    if let total = batch["Avail"] as? Int {
        totalCount += total
    }
}
if orderCount > totalCount {
    print("Out of Stock")
} else {
    for each in 0..<batches.count {
        while let avail = batches[each]["Avail"] as? Int, avail > 0 && orderCount != 0 {
            if let tempCase = batches[each]["Case"] as? Int, avail >= `case`, orderCount >= `case` {
                batches[each]["Case"] = tempCase + 1
                orderCount -= `case`
                batches[each]["Avail"] = avail - `case`
            } else if let tempOuter = batches[each]["Outer"] as? Int, avail  >= outer, orderCount >= outer {
                batches[each]["Outer"] = tempOuter + 1
                orderCount -= outer
                batches[each]["Avail"] = avail - outer            
            } else if let tempPiece = batches[each]["Piece"] as? Int {
                batches[each]["Piece"] = tempPiece + 1
                orderCount -= piece
                batches[each]["Avail"] = avail - piece
            }
        }
        print("\(batches[each]["Name"]!) - Case: \(batches[each]["Case"]!), Outer: \(batches[each]["Outer"]!), Piece: \(batches[each]["Piece"]!)")    
    }
}