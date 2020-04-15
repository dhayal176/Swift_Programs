import Foundation

var input = 12321
var temp = input
var count = 1
var num = 0
while (input != 0) {
    count *= 10
    input /= 10
}
input = temp
while input != 0 {
    num += (input % 10) * count
    input /= 10
    count /= 10
}
if (num / 10) == temp {
    print("Palindrome")
}else {    
    print("Not a Palindrome")
}