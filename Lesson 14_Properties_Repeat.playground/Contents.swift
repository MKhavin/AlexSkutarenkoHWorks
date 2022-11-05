import Foundation

//Exercise 1

struct MyDate {
    let day, month, year: UInt
}

let currentDay = MyDate(day: 22, month: 2, year: 2022)

struct Student {
    var firstName: String {
        willSet {
            print("New value(\(newValue) will be set.")
        }
        didSet {
            print("Old value(\(oldValue) was replaced by new.")
            firstName = firstName.capitalized
        }
    }
    
    var lastName: String {
        didSet {
            print("Old value(\(oldValue) was replaced by new.")
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        get {
            firstName + " " + lastName
        }
        set {
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    let birthday: MyDate
    
    var age: UInt {
        let year = currentDay.year - birthday.year
        if year < 1 {
            return 0
        } else if birthday.month < currentDay.month {
            return year - 1
        } else if birthday.month > currentDay.month {
            return year
        } else if birthday.day < currentDay.year {
            return year - 1
        } else {
            return year
        }
    }
    
    var studyQuantity: UInt {
        var year: UInt = 0
        if age >= 6 {
            year = age - 6
        }
        return year
    }
}

var firstStudent = Student(firstName: "Michael", lastName: "Khavin", birthday: MyDate(day: 23, month: 5, year: 1997))
firstStudent.firstName = "michael"
firstStudent.fullName = "rONE"
firstStudent.fullName
firstStudent.fullName = "mIchael khavIN"
firstStudent.fullName


//Exercise 2
struct MyPoint {
    var x, y: Int
}

struct Section {
    var firstPoint, secondPoint: MyPoint
    
    var sectionCenter: MyPoint {
        get {
            let x = (secondPoint.x + firstPoint.x) / 2
            let y = (secondPoint.y + firstPoint.y) / 2
            return MyPoint(x: x, y: y)
        }
        set {
            let xDifference = newValue.x - sectionCenter.x
            let yDifference = newValue.y - sectionCenter.y
            firstPoint = MyPoint(x: firstPoint.x + xDifference,
                                 y: firstPoint.y + yDifference)
            secondPoint = MyPoint(x: secondPoint.x + xDifference,
                                  y: secondPoint.y + yDifference)
        }
    }
    
    var sectionLength: Double {
        get {
            let x = Double(secondPoint.x - firstPoint.x)
            let y = Double(secondPoint.y - firstPoint.y)
            let length = pow(x, 2.0) + pow(y, 2.0)
            return sqrt(length)
        }
        set {
            let difference = Int(newValue - sectionLength)
            secondPoint = MyPoint(x: secondPoint.x + difference,
                                  y: secondPoint.y + difference)
        }
    }
}

var sec = Section(firstPoint: MyPoint(x: 4, y: 1),
                  secondPoint: MyPoint(x: 8, y: 5))
sec.sectionCenter
sec.sectionLength
sec.sectionCenter = MyPoint(x: -4, y: 8)
sec.secondPoint
sec.sectionLength = 7
sec.secondPoint
