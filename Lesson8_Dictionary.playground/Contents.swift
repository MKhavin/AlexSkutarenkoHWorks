import Foundation

//Exercise 1
print("Exercise 1\n")

var studMarks = ["MKhavin": 5, "RKhavin": 3, "ASkutarenko": 5,
                 "VBelyakov": 4, "PEfimov": 4, "AShvedov": 2]

studMarks.updateValue(3, forKey: "OOmarov")
studMarks.updateValue(4, forKey: "ANovichkov")
studMarks.updateValue(4, forKey: "RKhavin")
studMarks.updateValue(5, forKey: "PEfimov")
studMarks.removeValue(forKey: "AShvedov")
studMarks.removeValue(forKey: "ANovichkov")

let sumMark = studMarks.values.reduce(0, {$0 + $1})
var avgMark = Double(sumMark) / Double(studMarks.values.count)
avgMark = round(avgMark * 100) / 100

print("Student marks:\n \(studMarks)")
print("Sum mark: \(sumMark) Avg mark: \(avgMark)")
print("\n--------------------------\n")

//Exercise 2
print("Exercise 2\n")

let monthsDays = ["Jan": 31, "Feb": 28, "Mar": 31,
                  "Apr": 30, "May": 31, "Jun": 30,
                  "Jul": 31, "Aug": 31, "Sep": 30,
                  "Oct": 31, "Nov": 30, "Dec": 31]

for (key, value) in monthsDays {
    print("Month: \(key) Days: \(value)")
}
print("\n")

for key in monthsDays.keys {
    print("Month: \(key) Days: \(monthsDays[key]!)")
}
print("\n--------------------------\n")

//Exercise 3
print("Exercise 3\n")

let letters = ["A", "B", "C", "D", "E", "F", "G", "H"]
let columnsNumber = 8
var chessCells = [String: Bool]()

for (index, value) in letters.enumerated() {
    for columnNumber in 1...columnsNumber {
        let isColored = (index + 1 + columnNumber) % 2 == 0
        let cellKey = value + String(columnNumber)

        chessCells.updateValue(isColored,
                               forKey: cellKey)
    }
}

print("Chess desk:")
for key in chessCells.keys.sorted() {
    print("\(key) - \(chessCells[key]!)")
}

print("\n--------------\n")

var isPrinted = false

for letter in letters {
    var row = "\(letter) "
    for columnNumber in 1...columnsNumber {
        if !isPrinted {
            if columnNumber == 1 {
                print("  ", terminator: "")
            }
            print(" \(columnNumber)", terminator: "")
        }
        let value = chessCells[letter + String(columnNumber)]!
        row += " \(value ? "\u{25A1}" : "\u{25A0}")"
    }
    if isPrinted {
        print(row)
    } else {
        isPrinted = true
        print("\n" + row)
    }
}
