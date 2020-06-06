import Foundation

let INPUT_FROM_STDIN = true
let DEBUG_PRINT = false

func debugPrint(_ msg: String) {
    if DEBUG_PRINT {
        print(msg)
    }
}

var askCount = 0
/// a, b の大小を質問して結果を返す
///  return true a > b, false a < b
func askQuestion(_ a:String, _ b:String) -> Bool {
    askCount += 1
    if INPUT_FROM_STDIN {
        print("? \(a) \(b)")
        fflush(stdout)
        let ans = readLine()!
        return ans == ">" ? true : false
    } else {
        return a > b
    }

}

// 履歴から挿入場所を探す, 見つからない場合は負の値を返す
func searchFromHistory(_ history: [(Int, Bool)], _ listSize: Int) -> Int {
    if history.count == 0 { return -1  }

    let sortedHistory = history.sorted{ $0.0 < $1.0 }
    var before = sortedHistory[0]
    if before.0 == 0 && before.1 == false {
        // 先頭にいれる
        return 0
    }

    for i in 1..<sortedHistory.count {
        let next = sortedHistory[i]
        if next.0 - before.0 == 1 && next.1 != before.1 {
            return next.0
        }

        before = next
    }

    if before.0 == listSize - 1 && before.1 == true {
        // 最後にいれる
        return listSize
    }

    return -1
}

/// 挿入場所を探索する(2分探索)
/// word: 対象文字, list:現在のリスト,
/// candidates: 挿入場所の候補, history: 探索の履歴
func searchInputPosition(_ word: String, _ list: [String],
                         _ candidates: [Int], _ history: inout [(Int, Bool)]) -> Int {
    debugPrint("> \(word) : \(candidates), \(history)")
    // 空の時は先頭にいれる
    if list.count == 0 {return 0}

    // 探索を続行
    let canIndex = candidates.count / 2
    let searchPosition = candidates[canIndex]
    let askResult = askQuestion(word, list[searchPosition])
    history.append((searchPosition, askResult)) // 履歴に追加
    // 履歴から返せるか確認
    let check = searchFromHistory(history, list.count)
    debugPrint("+ \(word) : \(check), \(history)")
    if check >= 0 {
        return check
    }

    // 返せないので探索を続行
    if askResult  {
        // 右側を探索
        let scope = Array(candidates[(canIndex + 1)..<candidates.count])
        return searchInputPosition(word, list, scope, &history)
    } else {
        // 左側を探索
        let scope = Array(candidates[0..<canIndex])
        return searchInputPosition(word, list, scope, &history)
    }
}

func checkWords(n: Int, q: Int, randomWords: [String]) -> [String] {
    var sorted: [String] = []

    for word in randomWords {
        let candidates = Array(0..<sorted.count)
        var history: [(Int, Bool)] = []
        debugPrint("=> \(word) : \(sorted) \(candidates)")
        let index = searchInputPosition(word, sorted, candidates, &history)
        debugPrint("\(word) : \(index) : \(sorted)")
        if index < 0 {
            debugPrint("error: \(word), \(sorted), \(candidates), \(history)")
            break
        }

        sorted.insert(word, at: index)
    }

    return sorted
}

var str = ""
if INPUT_FROM_STDIN {
    str = readLine()!
} else {
    str = "5 100"
}
let values = str.components(separatedBy: " ")
let n = Int(values[0])!
let q = Int(values[1])!

/// 文字列一覧
var words: [String] = []
for i in 0..<n {
    let s = String(UnicodeScalar(UInt8(0x41 + i)))
    words.append(s)
}


/*
for _ in 0..<100 {
    //let words = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
    let words = ["A", "B", "C", "D", "E"]
    let random = words.shuffled()
    
    askCount = 0
    if words != checkWords(n: words.count, q: 100, randomWords:random) {
        print("ERROR: \(random)")
    } else {
        print("OK: \(random) \(askCount)")
    }
}
*/

// 質問フェーズ
// let sortedList = checkWords(n: n, q: q, randomWords: ["E", "F", "A", "B", "H", "I", "C", "D", "G"])
let sortedList = checkWords(n: n, q: q, randomWords: words)
print("! \(sortedList.joined(separator:""))")
fflush(stdout)

