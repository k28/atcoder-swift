import Foundation

guard let input = readLine() else {
    print("input error")
    exit(1)
}

let values = input.components(separatedBy: " ")
let n = Int(values[0])!
let a = Int(values[1])!
let b = Int(values[2])!

var total = 0
for i in 0...n {
    var count = 0
    String(i).forEach{ count += Int(String($0))! }
    if a <= count && count <= b {
        total += i
        continue
    }
}

print(total)

