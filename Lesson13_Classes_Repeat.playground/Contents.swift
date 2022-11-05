//Exercise 1
struct Student {
    var name, surname: String
    var avgMark: Float
    let birthDate: UInt
}

var firstStudent = Student(name: "Michael", surname: "Khavin", avgMark: 4.8, birthDate: 1997)
var secondStudent = Student(name: "Rone", surname: "Khavin", avgMark: 4.3, birthDate: 2000)
var thirdStudent = Student(name: "Milana", surname: "Khavina", avgMark: 5.0, birthDate: 2012)
var fourthStudent = Student(name: "Avtandil", surname: "Khavin", avgMark: 4.0, birthDate: 1961)

var students = [firstStudent, secondStudent, thirdStudent, fourthStudent]

func printStudents(journal: [Student]) {
    var iterator = 0
    while iterator < journal.count {
        print("\(iterator + 1). Name: \(journal[iterator].name)\nSurname: \(journal[iterator].surname)")
        print("Birthdate: \(journal[iterator].birthDate)\nAvg. mark: \(journal[iterator].avgMark)")
        print("\n----------------------------------\n")
        iterator += 1
    }
}

printStudents(journal: students)

var sortedJournal = students.sorted() {
    $0.avgMark < $1.avgMark
}

print("Sorted journal.\n")
printStudents(journal: sortedJournal)

sortedJournal = students.sorted() {
    if $0.surname == $1.surname {
        return $0.name < $1.name
    } else {
        return $0.surname < $1.surname
    }
}

print("Sorted journal(by surname and name).\n")
printStudents(journal: sortedJournal)

var editJournal = students
editJournal[0].surname = "Magalashvili"
editJournal[3].avgMark = 4.5

editJournal
students

//Exercise 2.
//Exercise 1
class StudentClass {
    var name, surname: String
    var avgMark: Float
    let birthDate: UInt
    
    init(name: String, surname: String, avgMark: Float, birthDate: UInt) {
        self.name = name
        self.surname = surname
        self.avgMark = avgMark
        self.birthDate = birthDate
    }
}

var firstStudentClass = StudentClass(name: "Michael", surname: "Khavin", avgMark: 4.8, birthDate: 1997)
var secondStudentClass = StudentClass(name: "Rone", surname: "Khavin", avgMark: 4.3, birthDate: 2000)
var thirdStudentClass = StudentClass(name: "Milana", surname: "Khavina", avgMark: 5.0, birthDate: 2012)
var fourthStudentClass = StudentClass(name: "Avtandil", surname: "Khavin", avgMark: 4.0, birthDate: 1961)

var studentsClass = [firstStudentClass, secondStudentClass, thirdStudentClass, fourthStudentClass]

func printStudents(journal: [StudentClass]) {
    var iterator = 0
    while iterator < journal.count {
        print("\(iterator + 1). Name: \(journal[iterator].name)\nSurname: \(journal[iterator].surname)")
        print("Birthdate: \(journal[iterator].birthDate)\nAvg. mark: \(journal[iterator].avgMark)")
        print("\n----------------------------------\n")
        iterator += 1
    }
}

printStudents(journal: students)

var sortedJournalClass = studentsClass.sorted() {
    $0.avgMark < $1.avgMark
}
students

print("Sorted journal.\n")
printStudents(journal: sortedJournalClass)

sortedJournalClass = studentsClass.sorted() {
    if $0.surname == $1.surname {
        return $0.name < $1.name
    } else {
        return $0.surname < $1.surname
    }
}

print("Sorted journal(by surname and name).\n")
printStudents(journal: sortedJournalClass)

let editJournalClass = studentsClass
editJournalClass[0].surname = "Magalashvili"
editJournalClass[3].avgMark = 4.5

editJournalClass
studentsClass

//Exercise 3.
enum Color: String {
    case black = "Black"
    case white = "White"
}

enum BoardColumnIdentifires: Character, CaseIterable {
    var index: Int {
        switch self {
        case .a: return 1
        case .b: return 2
        case .c: return 3
        case .d: return 4
        case .e: return 5
        case .f: return 6
        case .g: return 7
        case .h: return 8
        }
    }
    
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case h = "H"
}

enum ChessFigureType: String, CaseIterable {
    case pawn = "Pawn"
    case knight = "Knight"
    case bishop = "Bishop"
    case rook = "Rook"
    case queen = "Queen"
    case king = "King"
    
    var index: Int {
        switch self {
        case .king: return 0
        case .queen: return 1
        case .rook: return 2
        case .bishop: return 3
        case .knight: return 4
        case .pawn: return 5
        }
    }
}

class ChessFigure {
    let type: ChessFigureType
    let color: Color
    private(set) var row: Int
    private(set) var column: BoardColumnIdentifires
    
    init(type: ChessFigureType, color: Color, row: Int, column: BoardColumnIdentifires) {
        self.type = type
        self.color = color
        self.row = row
        self.column = column
    }
    
    func printFigureInfo() {
        print("Name: \(self.type.rawValue)\nColor: \(self.color.rawValue) \nCoordinates: (\(self.row),\(self.column.rawValue))")
        print("----------------------------------------\n")
    }
    
    func changeCoordinatesTo(row: Int, column: Character) {
        guard (1...8).contains(row), let currentColumn = BoardColumnIdentifires(rawValue: column) else {
            print("Invalid coordinates. Please, try again ! \n")
            return
        }
        
        self.row = row
        self.column = currentColumn
    }
    
    func getUnicodeSymbol() -> Character {
//        switch (type, color) {
//        case (.pawn, .black): return "\u{265F}"
//        case (.pawn, .white): return "\u{2659}"
//        case (.king, .black): return "\u{265A}"
//        case (.king, .white): return "\u{2654}"
//        case (.rook, .black): return "\u{265C}"
//        case (.rook, .white): return "\u{2656}"
//        case (.bishop, .black): return "\u{265D}"
//        case (.bishop, .white): return "\u{2657}"
//        case (.knight, .black): return "\u{265E}"
//        case (.knight, .white): return "\u{2658}"
//        case (.queen, .black): return "\u{265B}"
//        case (.queen, .white): return "\u{2655}"
//        }
        let delta = (color == .white) ? 0 : ChessFigureType.allCases.count
        let currentSymbol = UnicodeScalar(0x2654 + type.index + delta) ?? UnicodeScalar(0)
        return Character(currentSymbol!)
    }
}

func drawChessBoard(figures: [ChessFigure]) {
    var row = 8
    let columnIdentifires = BoardColumnIdentifires.allCases
    
    while row > 0 {
        var column = 0
        while column < 8 {
            let currentIndex = columnIdentifires[column]
            
            let figure = figures.first {
                $0.column.rawValue == currentIndex.rawValue && $0.row == row
            }
            
            if figure != nil {
                print("\(figure!.getUnicodeSymbol())", terminator: "")
            } else if (row + currentIndex.index) % 2 == 0 {
                print("\u{25A0}", terminator: "")
            } else {
                print("\u{25A1}", terminator: "")
            }
            column += 1
        }
        print()
        row -= 1
    }
    print("----------------------\n")
}

var figures: [ChessFigure] = [
    ChessFigure(type: .rook, color: .white, row: 6, column: .a),
    ChessFigure(type: .rook,color: .white, row: 5, column: .b),
    ChessFigure(type: .king, color: .black, row: 8, column: .a)
]

figures.forEach { $0.printFigureInfo() }

drawChessBoard(figures: figures)
figures[0].changeCoordinatesTo(row: 2, column: "F")
figures[1].changeCoordinatesTo(row: 10, column: "F")
drawChessBoard(figures: figures)

