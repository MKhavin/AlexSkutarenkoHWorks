import Foundation
import Darwin

class Human {
    var weight: Int
    var age: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() {
        
    }
    
    deinit {
        print("human deinitialized")
    }
}


enum Color: Int {
    case black, white
    
    init?(value: Int) {
        switch value {
        case 0: self = .black
        case 1: self = .white
        default: return nil
        }
    }
}

let a = Color(value: -1)

a?.rawValue

struct Size {
    var width: Int
    var height: Int
    
    init?(width: Int, height: Int) {
        guard width > 0 && height > 0 else {
            return nil
        }
        
        self.width = width
        self.height = height
    }
}

class Friend: Human {
    var name: String
    let skin: Color = {
        let random = Int(arc4random_uniform(2))
        let color = Color(value: random)!
        return color
    }()
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        super.init(weight: 2, age: 2)
    }
    
    required init() {
        name = ""
        super.init(weight: 2, age: 2)
    }
    
    deinit {
        print("friend deinitialized")
    }
}

let f = Friend(name: "a")

class BestFriend: Friend {
    
    override init(name: String) {
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    deinit {
        print("best friend deinitialized")
    }
}

struct Test {
    var bestFriend: BestFriend? = BestFriend(name: "")
}

var test: Test? = Test()

test!.bestFriend = nil

var f5 = Friend(name: "")
