//Exercise 1
print("Exercise 1\n")

let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print("Day in each month:")
for value in daysInMonth {
    print(value)
}

let monthsNames = ["January", "February", "March",
                   "April", "May", "June",
                   "July", "August", "September",
                   "October", "November", "December"]

print("\nDay in each month:")
for index in 0..<monthsNames.count {
    print("\(monthsNames[index]) - \(daysInMonth[index])")
}

//let daysAndMonthsNames: [(month: String, days: Int)] = [("Jan", 31), ("Feb", 28), ("Mar", 31),
//                                                        ("Apr", 30), ("May", 31), ("Jun", 30),
//                                                        ("Jul", 31), ("Aug", 31), ("Sep", 30),
//                                                        ("Oct", 31), ("Nov", 30), ("Dec", 31)]
var daysAndMonthsNames = [(month: String, days: Int)]()

for index in 0..<monthsNames.count {
    daysAndMonthsNames.append((monthsNames[index], daysInMonth[index]))
}

print("\nDay in each month:")
for value in daysAndMonthsNames {
    print("\(value.month) - \(value.days)")
}

let myBirthday = (day: 23, month: 5)
let monthsDaysBeforeBirthday = daysInMonth[0..<myBirthday.month - 1]
var daysBeforeBirthday = myBirthday.day

for value in monthsDaysBeforeBirthday {
    daysBeforeBirthday += value
}
print("\nDays before my birthday (\(myBirthday.day).\(myBirthday.month)): \(daysBeforeBirthday)")
print("\n-----------------------------\n")

//Exercise 2
print("Exercise 2")

let numbers = [1, nil, 234, nil, 22]
var sum = 0

print("Summary(via optional binding): ", terminator: " ")
for value in numbers {
    if let number = value {
        sum += number
    }
}
print(sum)

sum = 0
print("Summary(via force unwrapping): ", terminator: " ")
for number in numbers {
    if number != nil {
        sum += number!
    }
}
print(sum)

sum = 0
print("Summary(via nil coalescing): ", terminator: " ")
for number in numbers {
    sum += number ?? 0
}
print(sum)
print("\n--------------------------\n")

//Exersice 3
print("Exercise 3")

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var symbols = [String]()

for letter in alphabet {
    symbols.insert(String(letter), at: 0)
}

print("Inverted alphabet: \(symbols)")
