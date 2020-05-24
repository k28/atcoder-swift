import Foundation

guard let input = readLine() else {
    print("input error.")
    exit(1)
}

let values = input.components(separatedBy: " ")

let a = Int(values[0])!
let b = Int(values[1])!

if a * b % 2 == 0 {
    print("Even")
} else {
    print("Odd")
}

