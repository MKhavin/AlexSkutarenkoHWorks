import Foundation

//Exercise 1 & 2
struct Date: Equatable {
    let day, month, year: UInt
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return (lhs.month == rhs.month
                && lhs.day == rhs.day
                && lhs.year == rhs.year)
    }
}

struct Student {
    var firstName: String {
        willSet {
            print("Changing firstname from \(firstName) to \(newValue)")
        }
        didSet {
            print("Changed firstname from \(oldValue) to \(firstName)")
            firstName = firstName.capitalized(with: nil)
        }
    }
    var lastName: String {
        didSet {
            print("Changed last name from \(oldValue) to \(lastName)")
            lastName = lastName.capitalized(with: nil)
        }
    }
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
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
    let birthDate: Date
    var age: UInt {
//        func getMonthDay(month: UInt) -> UInt {
//            switch month {
//            case 2: return 28
//            case let value where value % 2 != 0 && value > 7:
//                fallthrough
//            case let value where value % 2 == 0 && value < 7:
//                return 30
//            case let value where value % 2 != 0 && value <= 7:
//                fallthrough
//            case let value where value % 2 == 0 && value > 7:
//                return 31
//            default: return 0
//            }
//        }
        
        let currentDay = Date(day: 28, month: 11, year: 2021)
        if currentDay == birthDate
            || currentDay.month > birthDate.month
            || (currentDay.month == birthDate.month && currentDay.day > birthDate.day) {
            return currentDay.year - birthDate.year
        } else {
            return currentDay.year - birthDate.year - 1
        }
        
//        var days = (currentDay.year - birthDate.year) * 365
//        var iterator = birthDate.month + 1
//        while iterator < birthDate.month {
//            if iterator > 12 {
//                iterator = 1
//            }
//            days += getMonthDay(month: iterator)
//            iterator += 1
//        }
//        days += birthDate.day
//        days += getMonthDay(month: UInt)
    }
    
    var learnYear: UInt {
        if age < 6 {
            return 0
        }
        let startYear = birthDate.year + 6
        let currentYear: UInt = 2021
        return currentYear - startYear
    }
}

var newStud = Student(firstName: "Michael", lastName: "Khavin", birthDate: Date(day: 23, month: 5, year: 1997))
newStud.age
newStud.fullName
newStud.learnYear
newStud.fullName = "Rone KHAVin"
newStud.fullName
newStud.firstName = "RONE!@#"
newStud.firstName
//Exercise 3 & 4

struct Point {
    var x, y: Int
}

struct Segment {
    var firstPoint: Point
    var secondPoint: Point
    var length: Double {
        get {
            let xProjection = Double(secondPoint.x - firstPoint.x)
            let yProjection = Double(secondPoint.y - firstPoint.y)
            return sqrt(pow(xProjection, 2.0) + pow(yProjection, 2.0))
        }
//        set {
//            if length != newValue {
//                return
//            }
//        }
    }
    var midSegmentPoint: Point {
        get {
            let midXPoint = (firstPoint.x + secondPoint.x) / 2
            let midYPoint = (firstPoint.y + secondPoint.y) / 2
            return Point(x: midXPoint, y: midYPoint)
        }
        set {
            let difference = Point(x: newValue.x - midSegmentPoint.x, y: newValue.y - midSegmentPoint.y)
            firstPoint = Point(x: firstPoint.x + difference.x, y: firstPoint.y + difference.y)
            secondPoint = Point(x: secondPoint.x + difference.x, y: secondPoint.y + difference.y)
        }
    }
}

var segment = Segment(firstPoint: Point(x: 1, y: 6), secondPoint: Point(x: 4, y: 1))
segment.length
segment.midSegmentPoint
segment.midSegmentPoint = Point(x: 4, y: 6)
segment.midSegmentPoint
segment.firstPoint
segment.secondPoint
