import Foundation

let productGroups = ["1000": "/1/2/3/4/5/",
                     "1002": "1/2/7",
                     "1004": "/5/2/4/"
                    ] 
let input = 4
for (key, value) in productGroups {
    var productId = value.split(separator: "/")
    for values in productId {
        /*  Doubt here
        if let pID = values as? String, input == Int(pID), let pGroup = key as? String {
            print(pGroup)
        }
        */
        if input == Int(values) {
            print(key)
        }
    }        
}