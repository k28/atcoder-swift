import Foundation

let str = readLine()!
let numbers = str.components(separatedBy: " ")
let x = Int(numbers[0])!
let y = Int(numbers[1])!

for i in 0...x {
    if ((i * 4) + ((x - i) * 2)) == y {
        print("Yes")
        exit(0)
    }
}

print("No")

