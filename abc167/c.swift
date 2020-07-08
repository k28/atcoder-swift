import Foundation

var result = Int.max
var memo: [[Int]: [Int]] = [:]

// indexesの配列の和を求める
func calc(indexes: [Int]) -> [Int] {

    if let r = memo[indexes] {
        return r
    }

    var values:[Int] = [Int](repeating: 0, count: M + 1)
    for i in indexes {
        let book = books[i]
        for v in 0..<(M + 1) {
            values[v] += book[v]
        }
    }

    memo[indexes] = values
    return values
}

// indexes: 選ぶ参考書, threshold: 目標の値
func check(indexes: [Int]) {
    var values = calc(indexes:indexes)

    let total = values.first!
    values.removeFirst()
    if values.filter({$0 < X}).count > 0 {
        return
    }

    //print(total)
    result = min(result, total)
}

// 全ての組み合わせを検索する
func search(indexes: [Int], current: inout [Int]) {
    if indexes.isEmpty { return }

    var copyIndexrs = indexes
    let first = copyIndexrs.first!
    copyIndexrs.removeFirst()

    //print("\(first), \(current)")
    check(indexes: current + [first])

    search(indexes: copyIndexrs, current: &current)
    current.append(first)
    search(indexes: copyIndexrs, current: &current)
    current.removeLast()
}

// main...

var values = readLine()!.components(separatedBy: " ")
let N = Int(values[0])! // 参考書の数
let M = Int(values[1])! // アルゴリズムの数
let X = Int(values[2])! // 目標の理解度

var books:[[Int]] = []
for _ in 0..<N {
    let book = readLine()!.components(separatedBy: " ").map{Int($0)!}
    books.append(book)
}

// 全部の組み合わせを検査する
let indexes = Array(0..<N)

var current:[Int] = []
search(indexes: indexes, current: &current)

print((result != Int.max) ? result : -1)

