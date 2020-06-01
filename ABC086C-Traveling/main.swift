import Foundation

/// time時間で(cx, cy)から(dx, dy)に到達できるか調べる
func moveTo(_ time: Int,_ cx: Int,_ cy: Int,_ dx: Int,_ dy: Int) -> Bool {

    let tx = abs(dx - cx)
    let ty = abs(dy - cy)

    let total = tx + ty

    if time < total {
        // 最短距離でもいけない
        return false
    }

    // 偶奇があっていれば到達可能
    if total % 2 == time % 2 {
        return true
    }

    return false
}

// 初期位置
var cx = 0
var cy = 0
var ct = 0  // 現在の時刻

let n = Int(readLine()!)!
for _ in 0..<n {
    let inputStr = readLine()!
    let values = inputStr.components(separatedBy: " ")

    let t = Int(values[0])!
    let x = Int(values[1])!
    let y = Int(values[2])!

    // print("\(t) \(x) \(y)")
    if moveTo((t - ct), cx, cy, x, y) == false {
        print("No")
        exit(0)
    }
    // 移動できたので場所と時間を進める
    cx = x
    cy = y
    ct = t
}

print("Yes")

