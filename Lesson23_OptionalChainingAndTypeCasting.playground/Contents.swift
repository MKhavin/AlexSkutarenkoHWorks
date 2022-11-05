//Exercise 1

enum Sex {
    case male, female
}

class Animal {
    func makeAVoice() {
        
    }
}

class Cat: Animal {
    override func makeAVoice() {
        print("Meow")
    }
}

class Dog: Animal {
    override func makeAVoice() {
        print("Meow")
    }
}

class Fish: Animal {
    override func makeAVoice() {
        print("Bul bul")
    }
}

class Human {
    let name: String
    let sex: Sex
    var dad: Man?
    var mom: Woman?
    var brothers: [Man]?
    var sisters: [Woman]?
    var pets: [Animal]?

    init(name: String, sex: Sex) {
        self.name = name
        self.sex = sex
    }
    
    init() {
        name = ""
        sex = .male
    }
}

class Man: Human {
    func moveSofa() {
        print("Moved sofa")
    }
}

class Woman: Human {
    func sayAWord() {
        print("Sayed a word")
    }
}


let names: [String: Sex] = [
    "Michael": .male,
    "Rone": .male,
    "Milana": .female,
    "David": .male,
    "Avtandil": .male,
    "Nino": .female,
    "Zhuzhuna": .female,
    "Inga": .female,
    "Nodari": .male,
    "Natia": .female,
    "Pavel": .male,
    "Alez": .male,
    "Anastasia": .female,
    "Boris": .male,
    "Valeria": .female,
    "Valerii": .male
]

let humans: [Human] = names.map {
    if $0.value == .male {
        return Man(name: $0.key, sex: $0.value)
    } else {
        return Woman(name: $0.key, sex: $0.value)
    }
}

let me = humans.first {
    $0.name == "Michael"
}

me?.dad = humans.first {
    $0.name == "Avtandil"
} as? Man

me?.mom = humans.first {
    $0.name == "Nino"
} as? Woman

humans.count
humans.forEach { human in
    if human !== me && human !== me?.dad && human !== me?.mom {
    switch human.sex {
        case .male where me?.brothers == nil:
            me?.brothers = []
            fallthrough
        case .male:
            me?.brothers?.append(human as! Man)
        case .female where me?.sisters == nil:
            me?.sisters = []
        case .female:
            me?.sisters?.append(human as! Woman)
        }
    }
}


let sistersCount = me?.sisters?.count
let brothersCount = me?.brothers?.count

//Exercise 2

var family: [Human] = []
me?.brothers?.forEach { family.append($0) }
me?.sisters?.forEach { family.append($0) }
family.append(me ?? Human())
family.append(me?.dad ?? Human())
family.append(me?.mom ?? Human())

family.forEach {
    switch $0 {
    case let human as Man:
        human.moveSofa()
    case let human as Woman:
        human.sayAWord()
    default:
        break
    }
}

//Exercise 3
for _ in 0...5 {
    let human = humans.randomElement()
    let petsQuantity = (0...5).randomElement() ?? 0
    human?.pets = []
    for _ in 0...petsQuantity {
        let animalType = (1...3).randomElement() ?? 1
        switch animalType {
        case 1:
            human?.pets?.append(Cat())
        case 2:
            human?.pets?.append(Dog())
        case 3:
            human?.pets?.append(Fish())
        default:
            break
        }
    }
}

var pets: [Animal] = []

humans.forEach { human in
    if let myPets = human.pets {
        pets += myPets
        print(human.name)
    }
}

var catsCount = 0
var dogsCount = 0
var fishCount = 0

pets.forEach { animal in
    switch animal {
    case let cat as Cat:
        cat.makeAVoice()
        catsCount += 1
    case let dog as Dog:
        dog.makeAVoice()
        dogsCount += 1
    case let fish as Fish:
        fish.makeAVoice()
        fishCount += 1
    default:
        break
    }
}

catsCount
dogsCount
fishCount
