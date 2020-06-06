import Foundation

/// a, b の大小を質問して結果を返す
///  return true a > b, false a < b
func askQuestion(_ a:String, _ b:String) -> Bool {
    print("? \(a) \(b)")
    fflush(stdout)
    // return a > b
    let ans = readLine()!
    return ans == ">" ? true : false
}

/// a1とa2を併合した配列を返す
func merge(a1: [String], a2: [String])  -> [String] {
    var merged: [String] = []
    var a1i = 0
    var a2i = 0
    while a1i < a1.count || a2i < a2.count {
        if a2i >= a2.count || (a1i < a1.count && askQuestion(a1[a1i], a2[a2i]) == false ) {
            merged.append(a1[a1i])
            a1i += 1
        } else {
            merged.append(a2[a2i])
            a2i += 1
        }
    }

    return merged
}

func mergeSort(_ list: [String]) -> [String] {
    if list.count > 1 {
        let m = list.count / 2
        let a1 = list[0..<m]
        let a2 = list[m..<list.count]
        // print("\(list) : \(a1) \(a2)")
        let sa1 = mergeSort(Array(a1)) 
        let sa2 = mergeSort(Array(a2))
        return merge(a1: sa1, a2: sa2)
    }

    return list
}

let str = readLine()!
let values = str.components(separatedBy: " ")
let n = Int(values[0])!
let q = Int(values[1])!

/// 文字列一覧
var words: [String] = []
for i in 0..<n {
    let s = String(UnicodeScalar(UInt8(0x41 + i)))
    words.append(s)
}

// 質問フェーズ
let sorted = mergeSort(words)

// 結果を出力
print("! \(sorted.joined(separator:""))")
fflush(stdout)

