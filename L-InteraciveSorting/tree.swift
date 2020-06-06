import Foundation

/// a, b の大小を質問して結果を返す
///  return true a > b, false a < b
func askQuestion(_ a:String, _ b:String) -> Bool {
    print("? \(a) \(b)")
    fflush(stdout)
    let ans = readLine()!
    return ans == ">" ? true : false

    //return a > b
}

class Tree {
    var left: Tree?  = nil
    var right: Tree? = nil
    var val: String 

    init(_ str: String) {
        self.val = str
    }

    func compare(_ tree: Tree) -> Bool {
        return askQuestion(val, tree.val)
    }

    func inorderTreeWalk(_ words: inout [String]) {
        if let left = self.left {
            left.inorderTreeWalk(&words)
        }
        words.append(val)
        if let right = self.right {
            right.inorderTreeWalk(&words)
        }
    }

    static func insert(root: Tree, val: Tree) {
        var y: Tree? = nil
        var x: Tree? = root
        var result: Bool = false
        while x != nil {
            y = x
            result = val.compare(x!)
            if result {
                x = x!.right
            } else {
                x = x!.left
            }
        }

        if y == nil {
            // ここにはこないはず
        } else {
            if result {
                y!.right = val
            } else {
                y!.left = val
            }
        }
    }
}

func checkWords(n: Int, q: Int, randomWords: [String]) -> [String] {

    var words = randomWords.shuffled()
    let root = Tree(words.popLast()!)
    while let str = words.popLast() {
        Tree.insert(root: root, val: Tree(str))
    }

    var sorted: [String] = []
    root.inorderTreeWalk(&sorted)
    return sorted
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


/*
for _ in 0..<100 {
    let words = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
    let random = words.shuffled()
    
    if words != checkWords(n: words.count, q: 100, randomWords:random) {
        print("ERROR: \(random)")
    } else {
        print("OK: \(random)")
    }
}
*/

// 質問フェーズ
let sortedList = checkWords(n: n, q: q, randomWords: words)

print("! \(sortedList.joined(separator:""))")
fflush(stdout)

