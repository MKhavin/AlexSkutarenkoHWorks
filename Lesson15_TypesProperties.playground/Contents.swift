//Exercise 1
struct FileDescription {
    
    var filePath, fileName, folderPath: String
    static let maxFileSize: UInt = 43123123124432
    var isHidden: Bool
    
}

//Exercise 2
enum Color: Int {
    static let quantity = 3
    static let startColor = Color.red
    static let endColor = Color.yellow
    
    case red = 0xff3366
    case blue = 0x3300ff
    case yellow = 0xffff5
}


@propertyWrapper
struct Less100 {
    private var number = 0
    var wrappedValue: Int {
        get {
            return number
        }
        set {
            number = (newValue > 100 || newValue < 0 ? 100 : newValue)
        }
    }
    
    init() {
        
    }
    
    init(value: Int) {
        wrappedValue = value
    }
}

//Exercise 3
class Human {
    var name: String {
        didSet {
            switch name.count {
            case Human.minNameLength...Human.maxNameLength:
                break
            default:
                print("Current name length limitation: \(Human.minNameLength)...\(Human.maxNameLength). Revert changes!!!")
                name = oldValue
            }
        }
    }
    var surname: String {
        didSet {
            switch surname.count {
            case Human.minSurnameLength...Human.maxSurnameLength:
                break
            default:
                print("Current surname length limitation: \(Human.minNameLength)...\(Human.maxNameLength). Revert changes!!!")
                surname = oldValue
            }
        }
    }
    @Less100 var age: Int {
        didSet {
            switch age {
            case Human.minAge...Human.maxAge:
                break
            default:
                print("Current age limitation: \(Human.minAge)...\(Human.maxAge). Revert changes!!!")
                age = oldValue
            }
        }
    }
    var height: Double {
        didSet {
            switch height {
            case Human.minHeight...Human.maxHeight:
                break
            default:
                print("Current height limitation: \(Human.minHeight)...\(Human.maxHeight). Revert changes!!!")
                height = oldValue
            }
        }
    }
    var weight: Double {
        didSet {
            switch weight {
            case Human.minWeight...Human.maxWeight:
                break
            default:
                print("Current weight limitation: \(Human.minWeight)...\(Human.maxWeight). Revert changes!!!")
                weight = oldValue
            }
        }
    }
    static let minAge = 0
    static let maxAge = 100
    static let minNameLength = 2
    static let maxNameLength = 10
    static let minSurnameLength = 3
    static let maxSurnameLength = 20
    static let minHeight = 80.0
    static let maxHeight = 230.0
    static let minWeight = 5.0
    static let maxWeight = 100.0
    static var quantity = 0
    
    init(name: String,
         surname: String,
         age: Int,
         height: Double,
         weight: Double) {
        
        self.name = name
        self.surname = surname
        self.age = age
        self.height = height
        self.weight = weight
        
        Human.quantity += 1
    }
}

let michael = Human(name: "Michael", surname: "Khavin", age: 24, height: 182.5, weight: 89.2)
let rone = Human(name: "R", surname: "Khavin", age: 21, height: 181, weight: 92.0)
Human.quantity
michael.name = "1"
michael.name
michael.age
michael.age = 150
michael.age

//TEST

class SuperClass {
    var hello: String
    var bye: String {
        "bye"
    }
    
    init() {
        hello = "hello"
    }
}

class Class: SuperClass {
    override var hello: String {
        willSet {
            print("I'm setting new value")
        }
    }
    override var bye: String {
        get {
            "bye"
        }
        set {
            hello = "hello2"
        }
    }
    
    override init() {
        super.init()
    }
}

var example = Class()
example.hello
//example.bye = "qwe"
