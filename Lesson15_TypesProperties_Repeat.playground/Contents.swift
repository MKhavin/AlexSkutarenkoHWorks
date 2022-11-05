//Exercise 1
import Foundation

struct FileDescription {
    var path: String
    var name: String
    static var maxSize: Int = 1_000_000
    var folderPath: String
    var isHidden: Bool
    var content: String
}


//Exercise 2
//enum ColorGamma: Int {
//
//}


//Exercise 3
@propertyWrapper
struct AgeAndHeightControl {
    private var number: UInt = 0
    private let maxValue: UInt
    private let minValue: UInt
    
    var wrappedValue: UInt {
        get {
          number
        }
        set {
            if number >= minValue && number <= maxValue {
                number = newValue
            } else {
                print("New value isn't conform to max(\(maxValue)) and min(\(minValue)) value")
            }
        }
    }
    
    init(maxValue: UInt, minValue: UInt) {
        self.maxValue = maxValue
        self.minValue = minValue
    }
}

@propertyWrapper
struct NameAndSurnameControl {
    private var value: String = ""
    private let minLength: Int
    private let maxLength: Int
    var wrappedValue: String {
        get {
            return value
        }
        set {
            if newValue.count >= minLength && newValue.count <= maxLength {
                value = newValue
            } else {
                print("New value isn't conform to max(\(maxLength)) and min(\(minLength)) length")
            }
        }
    }
    
    init(minLength: Int, maxLength: Int) {
        self.minLength = minLength
        self.maxLength = maxLength
    }
}


class Human {
    static let minHeight: UInt = 100
    static let maxHeight: UInt = 250
    static let minAge: UInt = UInt.min
    static let maxAge: UInt = 120
    static let minNameLength = 2
    static let maxNameLength = 20
    static let minSurnameLength = 5
    static let maxSurnameLength = 50
    static let maxWeight: Float = 150.0
    static let minWeight: Float = 10.0
    static var count = 0
    
    @NameAndSurnameControl(minLength: minNameLength, maxLength: maxNameLength) var name: String
    @NameAndSurnameControl(minLength: minSurnameLength, maxLength: maxSurnameLength) var surname: String
    @AgeAndHeightControl(maxValue: maxAge, minValue: minAge) var age: UInt
    @AgeAndHeightControl(maxValue: maxHeight, minValue: minHeight) var height: UInt
    var weight: Float {
        didSet {
            if weight >= Human.maxWeight || weight <= Human.minWeight {
                weight = oldValue
            }
        }
    }
    
    init(name: String, surname: String, age: UInt, height: UInt, weight: Float) {
        self.weight = weight
        self.height = height
        self.age = age
        self.name = name
        self.surname = surname
        Human.count += 1
    }
}

let me = Human(name: "Michael", surname: "Khavin", age: 25, height: 182, weight: 90.0)
me.height = 150
Human.count

let ab = 20.0
ab.truncatingRemainder(dividingBy: 2)
