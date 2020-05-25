import Foundation

let n = Int(readLine()!)!
let str = readLine()!

// 入力をdown wordにソート
let numbers = str.components(separatedBy: " ").map({Int($0)!}).sorted{$0 > $1}

var total = 0
for (index, val) in numbers.enumerated() {
    if index % 2 == 0 {
        total += val
    } else {
        total -= val
    }
}

print(total)

