import Foundation

let DEBUG = false

struct Point {
    var x: Double
    var y: Double
}

func dprint(_ str: String) {
    if DEBUG {
        print(str)
    }
}

// pからangle度回転した座標を求める
func calcMovePoint(_ p: Point, _ angle: Double) -> Point {
    let rad = angle * Double.pi / 180
    let x = p.x * cos(rad) - p.y * sin(rad)
    let y = p.x * sin(rad) + p.y * cos(rad)
    return Point(x: x, y: y)
}

let words = readLine()!.components(separatedBy: " ")
let A = Double(words[0])!
let B = Double(words[1])!
let H = Double(words[2])!
let M = Double(words[3])!
dprint("\(A) \(B) \(H) \(M)")

// A, BのH時M分の角度を求める
let angle_a = 360 / 12 * H + (360/12/60*M)
let angle_b = 360 / 60 * M

dprint("\(angle_a) \(angle_b)")

// 長針, 短針の座標を求める
let na = calcMovePoint(Point(x: 0, y: A), angle_a)
let nb = calcMovePoint(Point(x: 0, y: B), angle_b)
dprint("na: \(na)")
dprint("nb: \(nb)")

// 三平方の定理から２点間の距離を求める
let dx = abs(na.x - nb.x)
let dy = abs(na.y - nb.y)
let dc = sqrt(dx * dx + dy * dy)
print(dc)

