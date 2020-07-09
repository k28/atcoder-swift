import Foundation

let values = readLine()!.components(separatedBy: " ").map({Int($0)!})

print(values.firstIndex(of: 0)! + 1)

