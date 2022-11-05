import Foundation

//Exercise 1
print("Exercise 1\n")

let firstString = "12"
let secondString = "12331"
let thirdString = "12 may"
let fourthString = "1"
let fifthString = "05april"

let firstNumber = Int(firstString)
let secondNumber = Int(secondString)
let thirdNumber = Int(thirdString)
let fourthNumber = Int(fourthString)
let fifthNumber = Int(fifthString)

var sum = firstNumber ?? 0
sum += secondNumber ?? 0
sum += thirdNumber ?? 0
sum += fourthNumber ?? 0
sum += fifthNumber ?? 0

let firstStatement = firstNumber == nil ? "nil" : firstString
let secondStatement = secondNumber == nil ? "nil" : secondString
let thirdStatement = thirdNumber == nil ? "nil" : thirdString
let fourthStatement = fourthNumber == nil ? "nil" : fourthString
let fifthStatement = fifthNumber == nil ? "nil" : fifthString

print("\(firstStatement) + \(secondStatement) + \(thirdStatement) + \(fourthStatement) + \(fifthStatement) = \(sum)")
print(firstStatement + " + "
        + secondStatement + " + "
        + thirdStatement + " + "
        + fourthStatement + " + "
        + fifthStatement + " = "
        + String(sum))
print("\n---------------------------\n")

//Exercise 2
let firstEmoji = "\u{1F60E}"
let secondEmoji = "\u{1F60E}\u{270C}"
let thirdEmoji = "e\u{20DD}"
let fourthEmoji = "\u{53}\u{7C}"
let fifthEmoji = "\u{000C}"

firstEmoji.count
thirdEmoji.count
secondEmoji.count
fourthEmoji.count
fifthEmoji.count

NSString(string: firstEmoji).length
NSString(string: secondEmoji).length
NSString(string: thirdEmoji).length
NSString(string: fourthEmoji).length
NSString(string: fifthEmoji).length

//Exercise 3
print("Exercise 3\n")

let engAlphabet = "abcdefghijklmnopqrstuvwxyz"
let letter: Character = "f"
var index = 1

for character in engAlphabet {
    if character == letter {
        print("Index of letter \"\(letter)\" in eng. alphabet is \(index)")
        break
    }
    index += 1
}
