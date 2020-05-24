import Foundation

guard let count = readLine() else {
    print("input error")
    exit(1)
}

guard let numbers_str = readLine() else {
    print("input error 2")
    exit(2)
}

// 数値を全てIntにして配列に代入
var numbers = numbers_str.components(separatedBy: " ").map{Int($0)!}
// バラして書くと以下の形
// var numbers: [Int] = []
// for i in numbers_str.components(separatedBy: " ") {
//     numbers.append(Int(i)!)
// }

// 全て偶数の場合は全ての要素を2で割る
var answer = 0
while numbers.filter({$0 % 2 == 0}).count == numbers.count {
    numbers = numbers.map{$0 / 2}
    answer += 1
}

print(answer)

