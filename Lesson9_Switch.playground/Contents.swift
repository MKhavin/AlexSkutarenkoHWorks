//Exercise 1
print("Exercise 1\n")

let stringLiteral = """
Буква А известна всем,
Она не важная совсем.
Но у нее солидный вид,
Возглавляет алфавит.
Вот два столба наискосок,
Между ними — поясок.
Перед нами буква А
Алфавиту голова!
Б
Б похожа на трубу,
Что гудит «Бу-бу, бу-бу»!
"""

var vowels = 0
var consonants = 0
var numbersCount = 0
var otherSymbols = 0

for char in stringLiteral.lowercased() {
    switch char {
    case "а", "у", "о", "ы", "и", "э", "я", "ю", "ё", "е":
        vowels += 1
    case "б", "в", "г", "д", "ж", "з", "й", "к", "л", "м",
         "н", "п", "р", "с", "т", "ф", "х", "ц", "ч", "ш", "щ":
        consonants += 1
    case let number where number.isNumber:
        numbersCount += 1
    case " ", "\n", "\t":
        break;
    default:
        otherSymbols += 1
    }
}

print("Current string:\n<\(stringLiteral)>\n")
print("Vowels: \(vowels)",
      "Consonants: \(consonants)",
      "Numbers: \(numbersCount)",
      "Other symbols: \(otherSymbols)",
      separator: "\n")

//Exercise 2
print("\nExercise 2\n")

let age = 24

switch age {

case 0...3:   print("Baby")
case 4...10:  print("Child")
case 11...16: print("Teenager")
case 17...25: print("Young man")
case 26...60: print("Adult")
case 60...:   print("Old man")
default:      print("Dead man\\not born")

}

//Exercise 3
print("\nExercise 3\n")

let firstName = "Майкл"
let lastName  = "Хавин"
let thirdName = "Автандилович"

switch (firstName.lowercased(),
        lastName.lowercased(),
        thirdName.lowercased()) {

case (let firstName, _, _) where firstName.hasPrefix("а"): fallthrough
case (let firstName, _, _) where firstName.hasPrefix("о"): print(firstName)
case (_, _, let thirdName) where thirdName.hasPrefix("в"): fallthrough
case (_, _, let thirdName) where thirdName.hasPrefix("д"): print("\(firstName) \(thirdName)")
case (_, let secondName, _) where secondName.hasPrefix("е"): fallthrough
case (_, let secondName, _) where secondName.hasPrefix("з"): print(secondName)
default: print(firstName, lastName, thirdName)

}

//Exercise 4 - Very bad practice!!!!!
print("\nExercise 4\n")

let boats = ["B1": [(2, 3), (2, 4)], "B2": [(1, 1)], "B3": [(4, 9), (4, 10)]]
var hitBoats: [String: [(Int, Int)]] = [:]
let coordinates = (4, 10)

switch coordinates {

case let value where boats.contains{$0.value.contains{$0 == value}}:

    let currentData = boats.first{$0.value.contains{$0 == value}}!
    let currentKey = currentData.key
    var hitCoordinates = [value]
    if let hitValue = hitBoats[currentKey], !hitValue.contains(where: {$0 == value}) {
        hitCoordinates += hitValue
    }
    hitBoats.updateValue(hitCoordinates, forKey: currentKey)
    if hitCoordinates.count == currentData.value.count {
        print("Killed")
        break
    }
    print("Hit")

default: print("Missed")

}
