protocol Food {
    var name: String { get }
    func taste()
}

protocol Storable {
    var expired: Bool { get }
    var daysToExpire: Int { get }
}

class Bread: Food {
    let name: String
    
    func taste() {
        print("It tastes like a \(name).")
    }
    
    init(name: String) {
        self.name = name
    }
}

struct Milk: Food, Storable {
    var daysToExpire: Int
    
    var expired: Bool
    
    var name: String
    
    func taste() {
        print("It tastes like a \(name).")
    }
}

struct Chicken: Food, Storable {
    var expired: Bool
    
    var daysToExpire: Int
    
    var name: String
    
    func taste() {
        print("It tastes like a \(name).")
    }
    
    
}

class Egg: Food {
    var name: String
    
    func taste() {
        print("It tastes like a \(name).")
    }
    
    init(name: String) {
        self.name = name
    }
}

struct Wine: Food, Storable {
    var daysToExpire: Int
    
    var expired: Bool
    
    var name: String
    
    func taste() {
        print("It tastes like a \(name).")
    }
}

struct Champagne: Food {
    var daysToExpire: Int
    
    var expired: Bool
    
    var name: String
    
    func taste() {
        print("It tastes like a \(name).")
    }
}

var bag: [Food] = [
    Bread(name: "bread"),
    Milk(daysToExpire: 0, expired: true, name: "milk"),
    Chicken(expired: false, daysToExpire: 1, name: "chicken"),
    Egg(name: "egg"),
    Wine(daysToExpire: 10, expired: false, name: "wine"),
    Champagne(daysToExpire: 5, expired: false, name: "champagne")
]

typealias StorableFood = Food & Storable

var fridge: [StorableFood] = []

func printAboutFood(object: [Food]) {
    object.forEach {
        print($0.name)
        $0.taste()
        print("\n-----------------\n")
    }
}

func movetFoodToFridge(from bag: [Food]) {
    bag.forEach {
        if let storable = $0 as? StorableFood, !storable.expired {
            fridge.append(storable)
        } else {
            return
        }
    }
    
    fridge.sort {
        $0.daysToExpire < $1.daysToExpire
    }
    
    print("\nFood in fridge:\n")
    printAboutFood(object: fridge)
}

printAboutFood(object: bag)
movetFoodToFridge(from: bag)
