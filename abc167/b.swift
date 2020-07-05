import Foundation

let values = readLine()!.components(separatedBy: " ")

let A = Int(values[0])!
let B = Int(values[1])!
let C = Int(values[2])!
let K = Int(values[3])!

var a = 0
var b = 0
var c = 0
var k = K

a = min(A, K)
k -= a
if k > 0 {
    b = min(B, k)
    k -= b
    if k > 0 {
        c = min(C, k)
    }
}

var total = a + (-1 * c)
print(total)

