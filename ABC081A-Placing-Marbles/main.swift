import Foundation

guard let input: String = readLine() else {
    print("input error.")
    exit(1)
}

var count = 0
input.forEach {
    if $0 == "1" {
        count += 1
    }
}

print(count)

