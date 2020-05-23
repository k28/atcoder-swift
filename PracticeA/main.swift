
import Foundation

// readLineでstdinから読み込んで, Intに変換する
guard let astr = readLine(), let a = Int(astr) else {
    print("input error.")
    exit(1)
}

// str = "2 3"
let str = readLine()!

/*
let scanner = Scanner(string: str)
var b: Int = 0
var c: Int = 0
scanner.scanInt(&b)
scanner.scanInt(&c)
*/

let values = str.components(separatedBy: " ")
let b = Int(values[0])!
let c = Int(values[1])!

print("\(a + b + c) \(readLine()!)")

