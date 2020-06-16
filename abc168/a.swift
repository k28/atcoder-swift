import Foundation

let numstr = readLine()!
let last   = String(numstr.last!)

var word = ""
switch Int(last) {
    case 2,4,5,7,9: word = "hon"
    case 0,1,6,8 :  word = "pon"
    case 3:         word = "bon"
    default : break
}

print(word)

