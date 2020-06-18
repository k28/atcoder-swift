import Foundation

let k = Int(readLine()!)!
let s = readLine()!

if s.count <= k {
    print(s)
    exit(0)
}

// StringのRangeを使って切り出す場合
let subs = String(s[s.startIndex..<s.index(s.startIndex, offsetBy: k)]) + "..."
print(subs)

// let subs2 = String(s[..<s.index(s.startIndex, offsetBy: k)])
// print(subs2)

// prefixで取得する方法 高速
// let pref = s.prefix(k)
// print(pref)

// 文字列の後ろ余分な分だけ削る方法 (Substringが取得できる)
// let dstr = s.dropLast(s.count - k)
// print(dstr)



