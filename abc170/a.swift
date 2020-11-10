import Foundation

let str = readLine()!
let numbers = str.components(separatedBy: " ")
let val = numbers.firstIndex(of: "0")! + 1
print(val)

