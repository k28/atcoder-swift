import Foundation

let n = Int(readLine()!)!

var numbers: [Int] = []
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}

numbers.sort() {$0 > $1}

var count = 0
var current = 101
numbers.forEach(){
    if current > $0 {
        current = $0
        count += 1
    }
}

print(count)

