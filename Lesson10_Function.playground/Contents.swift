//Exercise 1
print("Exercise 1\n")

func smile() -> String {
    return "\u{1F600}"
}

func heart() -> String {
    return "\u{1F496}"
}

func eyes() -> String {
    return "\u{1F440}"
}

print(smile() + heart() + eyes())
print("\n--------------------------------\n")

//Exercise 2
print("Exercise 2\n")
func cellColor(x: String, y: UInt) -> String {
    let oddSymbols = ["a", "c", "e", "g"]

    if (!x.isEmpty && !x[x.startIndex].isLetter) || y == 0 {
        return "Wrong symbols"
    }

    let xNumber: UInt = oddSymbols.contains(x.lowercased()) ? 1 : 0

    return (xNumber + y) % 2 == 0 ? "White" : "Black"
}

let (x, y) = ("C", UInt(2))
let color = cellColor(x: x, y: y)

print("Current coordinates: \((x, y))")
print("Cell coor: \(color)")
print("\n--------------------------------\n")

//Exercise 3
print("Exercise 3\n")

func reverseSequence(_ range: Int...) -> [Int] {
    return reverseArray(range)
}

func reverseArray(_ array: [Int]) -> [Int] {
    return array.reversed()
}

var array = [2, 6, 0, 3, 1]

print("Current array: \(array)")
print("Reversed array: \(reverseArray(array))")
print("Current sequence: \((1, 3, 5, 123, 1, 2, 0))")
print("Reversed sequence: \(reverseSequence(1, 3, 5, 123, 1, 2, 0))")
print("\n--------------------------------\n")

//Exercise 4
print("Exercise 4\n")

func reverseArray(_ array: inout [Int]) {
    array = array.reversed()
}

print("Current array: \(array)")
reverseArray(&array)
print("Reversed array (inout parameter): \(array)")
print("\n--------------------------------\n")

//Exercise 5
print("Exercise 5\n")

func getReplaceWord(char: Character) -> String {
    let numbers: [Character: String] = ["1": "one",
                                        "0": "zero",
                                        "2": "two",
                                        "3": "three",
                                        "4": "four",
                                        "5": "five",
                                        "6": "six",
                                        "7": "seven",
                                        "8": "eight",
                                        "9": "nine"]

    switch char.lowercased() {
    case "a", "e", "i", "o", "u":
        return String(char.uppercased())
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
         "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        return String(char.lowercased())
    case _ where char.isNumber:
        return numbers[char]!
    default:
        return ""
    }
}

func getChangedString(from literal: String) -> String {
    if literal.isEmpty {
        return literal
    }

    var changedLiteral = ""
    for char in literal {
        changedLiteral.append(getReplaceWord(char: char))
    }

    return changedLiteral
}

let stringLiteral = "123abcdefgh-/ 123"
print("Original text: \(stringLiteral)")
print("Changed text: \(getChangedString(from: stringLiteral))")
