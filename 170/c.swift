import Foundation

let values = readLine()!.components(separatedBy: " ").map({Int($0)!})
let X = values[0]
let N = values[1]

if N == 0 {
    print(X)
    exit(0)
}

let numbers = readLine()!.components(separatedBy: " ").map({Int($0)!}).sorted()

for i in 0...X+1 {
    for d in [-1, 1] {
        let val = X + d * i
        if numbers.contains(val) == false {
            print(val)
            exit(0)
        }
    }
}

