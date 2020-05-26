import Foundation

let numbers = readLine()!.components(separatedBy: " ")
let n = Int(numbers[0])!
let y = Int(numbers[1])! // 2^7までの値が入る

// print("input: n = \(n), y = \(y)")

var a = -1
var b = -1
var c = -1

for i_a in 0...n {
    for i_b in 0...(n - i_a) {
        let i_c = n - (i_a + i_b)
        let total = 10000 * i_a + 5000 * i_b + 1000 * i_c
        if total == y {
            a = Int(i_a)
            b = Int(i_b)
            c = Int(i_c)
            break
        }
    }
    if a != -1 {
        break
    }
}

print("\(a) \(b) \(c)")

