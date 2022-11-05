//Exercise 1. Structures
struct Student {
    let name: String
    let surname: String
    let birthYear: UInt
    var avgScore: Double
}

var student1 = Student(name: "Michael", surname: "Khavin", birthYear: 1997, avgScore: 4.8)
var student2 = Student(name: "Rone", surname: "Khavin", birthYear: 2000, avgScore: 4.2)
var student3 = Student(name: "Milana", surname: "Khavina", birthYear: 2012, avgScore: 5.0)
var student4 = Student(name: "Nino", surname: "Magalashvili", birthYear: 1976, avgScore: 4.6)

var studentsJournal = [student1, student2, student3, student4]

func print(studentsJournal journal: [Student]) {
    for (index, value) in journal.enumerated() {
        print("\(index + 1). Name: \(value.name); Surname: \(value.surname); BirthYear: \(value.birthYear); Avg Score: \(value.avgScore)")
    }
}

print("Original journal.\n")
print(studentsJournal: studentsJournal)

var sortedJournal = studentsJournal.sorted { $0.avgScore > $1.avgScore }
print("Sorted journal.\n")
print(studentsJournal: sortedJournal)
print()

sortedJournal = studentsJournal.sorted {
    if $0.surname == $1.surname {
        return $0.name < $1.name
    } else {
        return $0.surname < $1.surname
    }
}
print("Sorted journal(by surname).\n")
print(studentsJournal: sortedJournal)

let copyStruct = sortedJournal
sortedJournal = sortedJournal.filter { $0.avgScore > 4.5 }

copyStruct
sortedJournal

//Exercise 2. Classes
class StudentClass {
    let name: String
    let surname: String
    let birthYear: UInt
    var avgScore: Double
    
    init(name: String, surname: String, birthYear: UInt, avgScore: Double) {
        self.name = name
        self.surname = surname
        self.birthYear = birthYear
        self.avgScore = avgScore
    }
}

let student5 = StudentClass(name: "Michael", surname: "Khavin", birthYear: 1997, avgScore: 4.8)
let student6 = StudentClass(name: "Rone", surname: "Khavin", birthYear: 2000, avgScore: 4.2)
let student7 = StudentClass(name: "Milana", surname: "Khavina", birthYear: 2012, avgScore: 5.0)
let student8 = StudentClass(name: "Nino", surname: "Magalashvili", birthYear: 1976, avgScore: 4.6)

var studentsClassJournal = [student5, student6, student7, student8]

func print(studentsJournal journal: [StudentClass]) {
    for (index, value) in journal.enumerated() {
        print("\(index + 1). Name: \(value.name); Surname: \(value.surname); BirthYear: \(value.birthYear); Avg Score: \(value.avgScore)")
    }
}

print("Original journal.\n")
print(studentsJournal: studentsClassJournal)

var sortedClassJournal = studentsClassJournal.sorted { $0.avgScore > $1.avgScore }
print("Sorted journal.\n")
print(studentsJournal: sortedClassJournal)
print()

sortedClassJournal = studentsClassJournal.sorted {
    if $0.surname == $1.surname {
        return $0.name < $1.name
    } else {
        return $0.surname < $1.surname
    }
}
print("Sorted journal(by surname).\n")
print(studentsJournal: sortedClassJournal)

let copyClass = sortedClassJournal
student5.avgScore = 1.0

copyClass
sortedClassJournal

//Exercise 3. Chess

enum Color: String {
    case black = "Black"
    case white = "White"
}

enum XValue: UInt {
    case a = 1, b, c, d, e, f, g, h
}

struct FigureCoordinates: Equatable {
    var x: XValue
    var y: UInt
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

class ChessFigure {
    
    let color: Color
    var name: String = "Figure"
    var unicodeView: String = ""
    var coordinates: FigureCoordinates
    
    init(color: Color, coordinates: FigureCoordinates) {
        self.color = color
        self.coordinates = coordinates
        self.unicodeView = setUnicodeView(color: color)
    }
    
    func getCurrentFigureInfo() {
        print("Current figure \"\(name)\"")
        print("Color: \(color.rawValue)\nCoordiantes(x: \(coordinates.x), y: \(coordinates.y))\n")
    }
    
    func setNewCoordinates(newCoordinates: FigureCoordinates) {
        if checkNewCoordinates(newCoordinates: newCoordinates) {
            self.coordinates = newCoordinates
        } else {
            print("Wrong coordinates !!!")
        }
    }
    
    func checkNewCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        return true
    }
    
    func setUnicodeView(color: Color) -> String {
        return color == .white ? "\u{25A0}" : "\u{25A1}"
    }
}

class Bishop: ChessFigure {
    
    override init(color: Color, coordinates: FigureCoordinates) {
        super.init(color: color, coordinates: coordinates)
        self.name = "Bishop"
    }
    
    override func checkNewCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        var acceptableCoordinates: [(x: UInt, y: UInt)] = []

        var newY = coordinates.y + 1
        var newX = coordinates.x.rawValue + 1
        
        var direction = true
        
        while newX <= 8 {
            if direction && newY <= 8 {
                acceptableCoordinates.append((newX, newY))
                newY += 1
            } else if !direction && newY >= 1 {
                acceptableCoordinates.append((newX, newY))
                newY -= 1
            } else if newY > 8 {
                direction = false
                newY = coordinates.y - 1
                newX = coordinates.x.rawValue
            } else {
                break
            }
            newX += 1
            if direction && newX == 0 {
                newX = coordinates.x.rawValue + 1
                direction = false
                newY = coordinates.y - 1
            }
        }
        
        newY = coordinates.y + 1
        newX = coordinates.x.rawValue - 1
        direction = true
        
        while newX >= 1 {
            if direction && newY <= 8 {
                acceptableCoordinates.append((newX, newY))
                newY += 1
            } else if !direction && newY >= 1 {
                acceptableCoordinates.append((newX, newY))
                newY -= 1
            } else if newY > 8 {
                direction = false
                newY = coordinates.y - 1
                newX = coordinates.x.rawValue
            } else {
                break
            }
            newX -= 1
            if direction && newX == 0 {
                newX = coordinates.x.rawValue - 1
                direction = false
                newY = coordinates.y - 1
            }
        }
        
        return !acceptableCoordinates.contains { $0.x == newCoordinates.x.rawValue && $0.y == newCoordinates.y }
    }
    
    override func setUnicodeView(color: Color) -> String {
        return color == .white ? "\u{2657}" : "\u{265D}"
    }
}

class King: ChessFigure {
    
    override init(color: Color, coordinates: FigureCoordinates) {
        super.init(color: color, coordinates: coordinates)
        self.name = "King"
    }
    
    override func checkNewCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        let rangeY = (coordinates.y - 1)...(coordinates.y + 1)
        let rangeX = (coordinates.x.rawValue - 1)...(coordinates.x.rawValue + 1)
        
        return !(rangeY.contains(newCoordinates.y) && rangeX.contains(newCoordinates.x.rawValue))
    }
    
    override func setUnicodeView(color: Color) -> String {
        return color == .white ? "\u{2654}" : "\u{265A}"
    }
}

class Knight: ChessFigure {
    
    override init(color: Color, coordinates: FigureCoordinates) {
        super.init(color: color, coordinates: coordinates)
        self.name = "Knight"
    }
    
    override func checkNewCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        var acceptableCoordinates: [(x: XValue, y: UInt)] = []
        for value in (coordinates.y - 2)...(coordinates.y + 2) {
            var operand: UInt = 0
            if value == coordinates.y || value > 8 || value < 1 {
                continue
            } else if value == (coordinates.y + 1) || value == (coordinates.y - 1) {
                operand = 2
            } else {
                operand = 1
            }
            
            if let valueX = XValue.init(rawValue: coordinates.x.rawValue + operand) {
                acceptableCoordinates.append((valueX, value))
            }
            
            if let valueX = XValue.init(rawValue: coordinates.x.rawValue - operand) {
                acceptableCoordinates.append((valueX, value))
            }
        }
        
        return !acceptableCoordinates.contains { $0.x == newCoordinates.x && $0.y == newCoordinates.y }
    }
    
    override func setUnicodeView(color: Color) -> String {
        return color == .white ? "\u{2658}" : "\u{265E}"
    }
}

class Pawn: ChessFigure {
    
    override init(color: Color, coordinates: FigureCoordinates) {
        super.init(color: color, coordinates: coordinates)
        self.name = "Pawn"
    }
    
    override func checkNewCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        var newY = (color == .white ? coordinates.y + 1 : coordinates.y - 1)
        if newY > 8 {
            newY = 8
        } else if newY < 1 {
            newY = 1
        }
        
        return !(newCoordinates.y == newY && coordinates.x == newCoordinates.x)
    }
    
    override func setUnicodeView(color: Color) -> String {
        return color == .white ? "\u{2659}" : "\u{265F}"
    }
}

class Rook: ChessFigure {
    
    override init(color: Color, coordinates: FigureCoordinates) {
        super.init(color: color, coordinates: coordinates)
        self.name = "Rook"
    }
    
    override func checkNewCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        let valuesRange: ClosedRange<UInt> = 1...8
        if valuesRange.contains(newCoordinates.x.rawValue) && coordinates.y == newCoordinates.y ||
            (1...8).contains(newCoordinates.y) && coordinates.x == newCoordinates.x {
            return false
        } else {
            return true
        }
    }
    
    override func setUnicodeView(color: Color) -> String {
        return color == .white ? "\u{2656}" : "\u{265C}"
    }
}

class Queen: ChessFigure {
    
    override init(color: Color, coordinates: FigureCoordinates) {
        super.init(color: color, coordinates: coordinates)
        self.name = "Rook"
    }
    
    override func checkNewCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        if !checkNewBishopCoordinates(newCoordinates: newCoordinates) {
            return false
        }
        
        if !checkNewKnightCoordinates(newCoordinates: newCoordinates) {
            return false
        }
        
        if !checkNewRookCoordinates(newCoordinates: newCoordinates) {
            return false
        }
        
        return true
    }
    
    override func setUnicodeView(color: Color) -> String {
        return color == .white ? "\u{2655}" : "\u{265B}"
    }
    
    func checkNewRookCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        let valuesRange: ClosedRange<UInt> = 1...8
        if valuesRange.contains(newCoordinates.x.rawValue) && coordinates.y == newCoordinates.y ||
            (1...8).contains(newCoordinates.y) && coordinates.x == newCoordinates.x {
            return false
        } else {
            return true
        }
    }

    func checkNewKnightCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        var acceptableCoordinates: [(x: XValue, y: UInt)] = []
        for value in (coordinates.y - 2)...(coordinates.y + 2) {
            var operand: UInt = 0
            if value == coordinates.y || value > 8 || value < 1 {
                continue
            } else if value == (coordinates.y + 1) || value == (coordinates.y - 1) {
                operand = 2
            } else {
                operand = 1
            }
            
            if let valueX = XValue.init(rawValue: coordinates.x.rawValue + operand) {
                acceptableCoordinates.append((valueX, value))
            }
            
            if let valueX = XValue.init(rawValue: coordinates.x.rawValue - operand) {
                acceptableCoordinates.append((valueX, value))
            }
        }
        
        return !acceptableCoordinates.contains { $0.x == newCoordinates.x && $0.y == newCoordinates.y }
    }

    func checkNewBishopCoordinates(newCoordinates: FigureCoordinates) -> Bool {
        var acceptableCoordinates: [(x: UInt, y: UInt)] = []

        var newY = coordinates.y + 1
        var newX = coordinates.x.rawValue + 1
        
        var direction = true
        
        while newX <= 8 {
            if direction && newY <= 8 {
                acceptableCoordinates.append((newX, newY))
                newY += 1
            } else if !direction && newY >= 1 {
                acceptableCoordinates.append((newX, newY))
                newY -= 1
            } else if newY > 8 {
                direction = false
                newY = coordinates.y - 1
                newX = coordinates.x.rawValue
            } else {
                break
            }
            newX += 1
            if direction && newX == 0 {
                newX = coordinates.x.rawValue + 1
                direction = false
                newY = coordinates.y - 1
            }
        }
        
        newY = coordinates.y + 1
        newX = coordinates.x.rawValue - 1
        direction = true
        
        while newX >= 1 {
            if direction && newY <= 8 {
                acceptableCoordinates.append((newX, newY))
                newY += 1
            } else if !direction && newY >= 1 {
                acceptableCoordinates.append((newX, newY))
                newY -= 1
            } else if newY > 8 {
                direction = false
                newY = coordinates.y - 1
                newX = coordinates.x.rawValue
            } else {
                break
            }
            newX -= 1
            if direction && newX == 0 {
                newX = coordinates.x.rawValue - 1
                direction = false
                newY = coordinates.y - 1
            }
        }
        
        return !acceptableCoordinates.contains { $0.x == newCoordinates.x.rawValue && $0.y == newCoordinates.y }
    }

}


func drawChessDesk(figures: [ChessFigure]) {
    var y: UInt = 8
    let xRange: ClosedRange<UInt> = 1...8
    while y > 0 {
        
        for x in xRange {
            let coordinates = FigureCoordinates(x: XValue(rawValue: x)!, y: y)
            let figure = figures.first {
                return $0.coordinates == coordinates
            }
            
            if figure != nil {
                
                print(figure!.unicodeView, terminator: "")
                
            } else if (x + y) % 2 == 0 {
                
                print("\u{25A1}", terminator: "")
                
            } else {
                print("\u{25A0}", terminator: "")
            }
        }
    
        y -= 1
        print()
    }

}

var kingWhite = King(color: .white, coordinates: FigureCoordinates(x: .b, y: 6))
var bishopWhite = Bishop(color: .white, coordinates: FigureCoordinates(x: .a, y: 3))
var queenWhite = Queen(color: .white, coordinates: FigureCoordinates(x: .d, y: 3))
var kingBlack = King(color: .black, coordinates: FigureCoordinates(x: .a, y: 4))
var chessFigures: [ChessFigure] = [kingWhite, bishopWhite, queenWhite, kingBlack]
chessFigures.forEach { $0.getCurrentFigureInfo() }

drawChessDesk(figures: chessFigures)

bishopWhite.setNewCoordinates(newCoordinates: FigureCoordinates(x: XValue.f, y: 8))
queenWhite.setNewCoordinates(newCoordinates: FigureCoordinates(x: XValue.f, y: 4))
kingBlack.setNewCoordinates(newCoordinates: FigureCoordinates(x: XValue.f, y: 4))
print("\n\n\n\n\n")

//chessFigures = [kingWhite, bishopWhite, queenWhite, kingBlack]
drawChessDesk(figures: chessFigures)
