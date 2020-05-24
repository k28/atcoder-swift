import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!
let x = Int(readLine()!)!

var count = 0
for a_i in 0...a {
    for b_i in 0...b {
        for c_i in 0...c {
            if (500 * a_i) + (100 * b_i) + (50 * c_i) == x {
                count += 1
            }
        }
    }
}

print(count)

