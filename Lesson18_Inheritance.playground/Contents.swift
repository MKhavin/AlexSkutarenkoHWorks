//Exercise 1

import Foundation
class Artist {
    let firstName: String
    let lastName: String
    
    func performance() {
        print("Artist.\nFirst name: \(firstName)\nLast name: \(lastName)")
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Dancer: Artist {
    override func performance() {
        super.performance()
        print("I'm dancing.")
    }
}

class Singer: Artist {
    override func performance() {
        super.performance()
        print("I'm singing")
    }
}

class Painter: Artist {
    let artistName: String
    
    init(firstName: String, lastName: String, artistName: String) {
        self.artistName = artistName
        super.init(firstName: firstName, lastName: lastName)
    }
    
    override func performance() {
        print("Artist.\nName: \(artistName)")
        print("I'm painter.")
    }
}

let artists = [
    Singer(firstName: "David", lastName: "Bowie"),
    Dancer(firstName: "Nikolay", lastName: "Tsiskaridze"),
    Painter(firstName: "Pablo", lastName: "Pikasso", artistName: "Pabasso")
]

artists.forEach {
    $0.performance()
    print()
}

//Exercise 2
class Vehicle {
    var name: String {
        "Vehicle"
    }
    var speed: Float {
        0
    }
    var capacity: Int {
        0
    }
    var cost: Float {
        0
    }
    
    func computeJourney(to length: Float, for count: Int) -> (time: Float, count: Int, cost: Float ) {
        let time = round((length / speed) * 100) / 100
        let journeyCount = ceil(Float(count) / Float(capacity))
        let totalPrice = Float(journeyCount) * cost
        return (time, Int(journeyCount), totalPrice)
    }
}

class AirPlane: Vehicle {
    override var name: String {
        "AirPlane"
    }
    override var speed: Float {
        800.5
    }
    override var capacity: Int {
        350
    }
    override var cost: Float {
        5000
    }
}

class Boat: Vehicle {
    override var name: String {
        "Boat"
    }
    override var speed: Float {
        50
    }
    override var capacity: Int {
        150
    }
    override var cost: Float {
        10000
    }
}

class Helicopter: Vehicle {
    override var name: String {
        "Helicopter"
    }
    override var speed: Float {
        400
    }
    override var capacity: Int {
        5
    }
    override var cost: Float {
        20000
    }
}

class Car: Vehicle {
    override var name: String {
        "Car"
    }
    override var speed: Float {
        120
    }
    override var capacity: Int {
        25
    }
    override var cost: Float {
        2500
    }
}

class Train: Vehicle {
    override var name: String {
        "Train"
    }
    override var speed: Float {
        100
    }
    override var capacity: Int {
        500
    }
    override var cost: Float {
        3500
    }
}

func getMinValue(newValue: Float, oldValue: Float?) -> Float? {
    if oldValue == nil || oldValue! > newValue {
        return newValue
    }
    
    return oldValue
}

let vehicles = [ AirPlane(), Boat(), Car(), Helicopter(), Train() ]
var minTime: Float? = nil
var minCost: Float? = nil
for vehicle in vehicles {
    let data = vehicle.computeJourney(to: 1000, for: 55)
    print("\(vehicle.name)")
    print("Total cost: \(data.cost)\nTotal time: \(data.time)\nTotal journeys: \(data.count)\n")
    
    minTime = getMinValue(newValue: data.time, oldValue: minTime)
    minCost = getMinValue(newValue: data.cost, oldValue: minCost)
}

print("Min time: \(minTime ?? 0)")
print("Min cost: \(minCost ?? 0)")

//Exercise 3
class Animal {
    let name: String
    let legsCount: Int
    let isAlive: Bool
    let canFly: Bool
    
    init(name: String, legsCount: Int, isAlive: Bool, canFly: Bool) {
        self.name = name
        self.legsCount = legsCount
        self.isAlive = isAlive
        self.canFly = canFly
    }
}

class Human: Animal {
    let surname: String
    let age: Int
    
    init(name: String, surname: String, legsCount: Int, age: Int) {
        self.surname = surname
        self.age = age
        super.init(name: name, legsCount: legsCount, isAlive: true, canFly: false)
    }
}

class Crocodile: Animal {
    var teethCount: Int
    
    init(name: String, legsCount: Int, teethCount: Int) {
        self.teethCount = 50
        super.init(name: name, legsCount: legsCount, isAlive: true, canFly: false)
    }
}

class Turtle: Animal {
    let childrenCount: Int
    let age: Int
    
    init(name: String, childrenCount: Int, legsCount: Int, age: Int) {
        self.childrenCount = childrenCount
        self.age = age
        super.init(name: name, legsCount: legsCount, isAlive: true, canFly: false)
    }
}

class Dinosaur: Animal {
    init(name: String, legsCount: Int, age: Int) {
        super.init(name: name, legsCount: legsCount, isAlive: false, canFly: false)
    }
}

let animals = [
    Human(name: "Michael", surname: "Khavin", legsCount: 2, age: 30),
    Dinosaur(name: "T-Rex", legsCount: 2, age: 1_000_000_000),
    Dinosaur(name: "Grass", legsCount: 4, age: 1_000_000_000),
    Turtle(name: "Mini", childrenCount: 150, legsCount: 4, age: 189),
    Crocodile(name: "Croco", legsCount: 4, teethCount: 50)
]

var reptiles = [Animal]()
var aliveAnimals = 0
var fourLegsCount = 0

animals.forEach {
    if $0.canFly == false && $0.isAlive {
        reptiles.append($0)
    }
    
    if $0.isAlive {
        aliveAnimals += 1
    }
    
    if $0.legsCount == 4 {
        fourLegsCount += 1
    }
}
aliveAnimals
fourLegsCount
reptiles

