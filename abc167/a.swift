import Foundation

let s = readLine()!
let t = readLine()!

// hasPrefixで確認する
print(t.hasPrefix(s) ? "Yes" : "No")

// 別解答 (dropLastで最後を削ってからsと比較する)
print(String(t.dropLast()) == s ? "Yes" : "No")

// 別解答 (Indexで比較する)
let v = t[..<s.endIndex]
print(v == s ? "Yes" : "No")

