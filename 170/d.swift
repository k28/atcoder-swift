import Foundation

let N = Int(readLine()!)!
let values = readLine()!.components(separatedBy: " ").map({Int($0)!})

func later_pattern() {
    var count = 0
    for i in 0 ..< N {
        var ok = true
        for j in 0 ..< N {
            if i == j { continue }
            if values[i] % values[j] == 0 {
                ok = false
                continue
            }
        }
        if ok {
            count += 1
        }
    }

    print(count)
}

func fast_pattern() {
    let sorted = values.sorted()
    var dp = [Bool](repeating: true, count: sorted.last! + 1)
    for i in 0 ..< N {
        if dp[sorted[i]] == false {continue}
        // 同じ数があるかチェック
        if 0 < i, sorted[i] == sorted[i - 1] {
            dp[sorted[i]] = false
        }
        // 倍数をマークする
        var a = sorted[i] * 2
        while a <= sorted.last! {
            dp[a] = false
            a += sorted[i]
        }
    }

    var count = 0
    for i in 0..<N {
        if dp[values[i]] {
            count += 1
        }
    }
    print(count)
}

fast_pattern()

