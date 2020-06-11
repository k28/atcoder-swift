import Foundation

let n = Int(readLine()!)!
let str = readLine()!

let words = str.components(separatedBy: " ")
if let _ = words.filter({ $0 == "0" }).first {
    print("0")
    exit(0)
}

var ans: UInt64 = 1
let max: UInt64 = 1_000_000_000_000_000_000
for i in 0..<n {
    let num = UInt64(words[i])!
    let (partialValue, overflow) = ans.multipliedReportingOverflow(by: num)
    if overflow || partialValue > max {
        print("-1")
        exit(0)
    }
    ans = partialValue
}

print("\(ans)")

