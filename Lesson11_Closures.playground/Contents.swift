
//Exercise 1
print("Exercise 1\n")

func randomFunc(closure: () -> Void) {
    for i in 1...10 {
        print(i)
    }
    
    closure()
}

randomFunc {
    print("It's a closure")
}

print("\n--------------------------------------\n")

//Exercise 2
print("Exercise 2\n")

var randomArray: [Int] = [3, 10, 1, 0, -209]
print(randomArray.sorted(by: {$0 < $1}))

print("\n--------------------------------------\n")

//Exercise 3
func getArrayElements(from array: [Int], by closure: (Int?, Int) -> Bool) -> Int {
    var number: Int?
    for el in array {
        if closure(number, el) {
            number = el
        }
    }
    
    return number ?? 0
}

let minValue = getArrayElements(from: randomArray) {result, value in
    result ?? 0 > value}
let maxValue = getArrayElements(from: randomArray) {result, value in
    result ?? 0 < value}

print("Min value: \(minValue), Max value: \(maxValue)")

print("\n--------------------------------------\n")

//Exercise 4
print("Exercise 4\n")

func getArrayString(string: String) -> [String] {
    var result: [String] = []
    
    for el in string {
        result.append(String(el))
    }
    
    return result
}

func getPriority(symbol: String) -> Int {
    switch symbol.lowercased() {
    case "a", "e", "i", "o", "u": return 1
    case let letter where Character(letter).isLetter: return 2
    case let letter where Character(letter).isNumber: return 3
    default: return 4
    }
}

let randString = "A!!...`C``ebcfa321"

let symbols = getArrayString(string: randString)

let resultString = symbols.sorted{
    switch (getPriority(symbol: $0), getPriority(symbol: $1)) {
    case let (firstPriority, secondPriority) where firstPriority < secondPriority: return true
    case let (firstPriority, secondPriority) where firstPriority == secondPriority:
        return $0.lowercased() <= $1.lowercased() ? true : false
    default: return false
    }
}

print(resultString.reduce(into: ""){$0 += $1})

print("\n--------------------------------------\n")

//Exercise 5
print ("Exercise 5\n")

func getArrayElements(from array: [String], by closure: (String?, String) -> Bool) -> String {
    var letter: String?
    for el in array {
        if letter == nil {
            letter = el
        }
        if closure(letter, el) {
            letter = el
        }
    }
    
    return letter ?? ""
}

let arrayLetters: [String] = ["d", "a", "z", "e"]


let minLetter = getArrayElements(from: arrayLetters, by: {result, value in
    UnicodeScalar(result ?? "")?.value ?? 0 > UnicodeScalar(value)?.value ?? 0})
let maxLetter = getArrayElements(from: arrayLetters, by: {result, value in
    UnicodeScalar(result ?? "")?.value ?? 0 < UnicodeScalar(value)?.value ?? 0})

print("Min letter: \(minLetter), Max letter: \(maxLetter)")
