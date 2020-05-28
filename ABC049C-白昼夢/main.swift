import Foundation

guard let input = readLine() else {
    print("input error")
    exit(1)
}

let regex = try! NSRegularExpression(pattern: "^(dream|dreamer|erase|eraser)+$")
if regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.count)) != nil {
    print("YES")
} else {
    print("NO")
}


