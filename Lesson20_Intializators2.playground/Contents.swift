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
}

class Student: Human {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(weight: 0, age: 0)
        
        weight = 50
    }
    
    override convenience init(weight: Int, age: Int) {
        self.init(firstName: "")
        self.weight = weight
        self.age = age
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
        self.age = 28
        test()
    }
}

class Doctor: Student {
    var fieldOfStudy: String
    
    init(fieldOfStudy: String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(firstName: "Doctor", lastName: "House")
    }
    
    override init(firstName: String, lastName: String) {
        fieldOfStudy = ""
        super.init(firstName: firstName, lastName: lastName)
    }
    
    /*
    override init(weight: Int, age: Int) {
        fieldOfStudy = ""
        super.init(weight: weight, age: age)
    }
    */
    
    convenience init(firstName: String) {
        self.init(fieldOfStudy: "")
        self.age = 35
        self.firstName = firstName
    }
}

let d1 = Doctor(fieldOfStudy: "")
let d2 = Doctor(firstName: "Hi")
