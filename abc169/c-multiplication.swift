import Foundation

// bは小数点2桁まで入っている. そのまま100を掛けて計算すると誤差が出るので
// 整数部と小数部に分けて計算して後で足す

let words = readLine()!.components(separatedBy: " ")
let a = Int(words[0])!
let b = words[1].components(separatedBy: ".").map(Int.init)

let up = a * b[0]!
let bottom = a * b[1]! / 100
print(up + bottom)


