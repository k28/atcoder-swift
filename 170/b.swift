import Foundation

let values = readLine()!.components(separatedBy: " ").map{Int($0)!}
assert(values.count == 2)
let X = values[0]
let Y = values[1]

for turu in 0...X {
    let kame = X - turu
    let legs = turu * 2 + kame * 4
    if legs == Y {
        print("Yes")
        exit(0)
    }
}

print("No")

