import Foundation

let str = readLine()!
let words = str.components(separatedBy: " ")
let a = Int(words[0])!
let b = Int(words[1])!

print("\(a * b)")

