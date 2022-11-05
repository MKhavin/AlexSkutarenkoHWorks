enum ChessFigure {
    
    enum Color: String {
        case black = "Black"
        case white = "White"
    }
    
    enum XValue: Int {
        case a = 1, b, c, d, e, f, g, h
    }
    
    case king(color: Color, x: XValue, y: UInt)
    case bishop(color: Color, x: XValue, y: UInt)
    case queen(color: Color, x: XValue, y: UInt)
    case knight(color: Color, x: XValue, y: UInt)
    case pawn(color: Color, x: XValue, y: UInt)
    case rook(color: Color, x: XValue, y: UInt)
    
    var rawValue: String {
        switch self {
        case .bishop(_, _, _): return "Bishop"
        case .king(_, _, _): return "King"
        case .queen(_, _, _): return "Queen"
        case .knight(_, _, _): return "Knight"
        case .pawn(_, _, _): return "Pawn"
        case .rook(_, _, _): return "Rook"
        }
    }
    
    func getCurrentFigureInfo() {
        print("Current figure \"\(self.rawValue)\"")
        switch self {
        case let .bishop(color, x, y): fallthrough
        case let .king(color, x, y): fallthrough
        case let .queen(color, x, y): fallthrough
        case let .knight(color, x, y): fallthrough
        case let .pawn(color, x, y): fallthrough
        case let .rook(color, x, y):
            print("Color: \(color.rawValue)\nCoordiantes(x: \(x), y: \(y))\n")
        }
    }
    
    func getAssociatedValues() -> (color: Color, x: XValue, y: UInt) {
        switch self {
        case let .bishop(color, x, y): fallthrough
        case let .king(color, x, y): fallthrough
        case let .queen(color, x, y): fallthrough
        case let .knight(color, x, y): fallthrough
        case let .pawn(color, x, y): fallthrough
        case let .rook(color, x, y):
            return (color, x, y)
        }
    }
    
    func getUnicodeView() -> String {
        switch self {
        case let .bishop(color, _, _):
            return color == .white ? "\u{2657}" : "\u{265D}"
        case let .king(color, _, _):
            return color == .white ? "\u{2654}" : "\u{265A}"
        case let .queen(color, _, _):
            return color == .white ? "\u{2655}" : "\u{265B}"
        case let .knight(color, _, _):
            return color == .white ? "\u{2658}" : "\u{265E}"
        case let .pawn(color, _, _):
            return color == .white ? "\u{2659}" : "\u{265F}"
        case let .rook(color, _, _):
            return color == .white ? "\u{2656}" : "\u{265C}"
        }
    }
}

func drawChessDesk(figures: [ChessFigure]) {
    var y = 8
    
    while y > 0 {
        
        for x in 1...8 {
            let figure = figures.first {
                let value = $0.getAssociatedValues()
                return value.y == y && value.x.rawValue == x
            }
            
            if figure != nil {
                
                print(figure!.getUnicodeView(), terminator: "")
                
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

var kingWhite = ChessFigure.king(color: .white, x: .b, y: 6)
var bishopWhite = ChessFigure.bishop(color: .white, x: .a, y: 3)
var queenWhite = ChessFigure.queen(color: .white, x: .d, y: 3)
var kingBlack = ChessFigure.king(color: .black, x: .a, y: 4)
var chessFigures = [kingWhite, bishopWhite, queenWhite, kingBlack]
chessFigures.forEach { $0.getCurrentFigureInfo() }

drawChessDesk(figures: chessFigures)


func checkNewPawnCoordinates(color: ChessFigure.Color,
                             newCoordinates: (x: ChessFigure.XValue, y: UInt),
                             oldCoordinates: (x: ChessFigure.XValue, y: UInt)) -> Bool {
    
    var newY = (color == .white ? oldCoordinates.y + 1 : oldCoordinates.y - 1)
    if newY > 8 {
        newY = 8
    } else if newY < 1 {
        newY = 1
    }
    
    return !(newCoordinates.y == newY && oldCoordinates.x == newCoordinates.x)
    
}

func checkNewRookCoordinates(color: ChessFigure.Color,
                             newCoordinates: (x: ChessFigure.XValue, y: UInt),
                             oldCoordinates: (x: ChessFigure.XValue, y: UInt)) -> Bool {
    
    let valuesRange = 1...8
    if valuesRange.contains(newCoordinates.x.rawValue) && oldCoordinates.y == newCoordinates.y ||
        (1...8).contains(newCoordinates.y) && oldCoordinates.x == newCoordinates.x {
     
        return false
        
    } else {
        
        return true
        
    }
    
}

func checkNewKingCoordinates(color: ChessFigure.Color,
                             newCoordinates: (x: ChessFigure.XValue, y: UInt),
                             oldCoordinates: (x: ChessFigure.XValue, y: UInt)) -> Bool {
    
    let rangeY = (oldCoordinates.y - 1)...(oldCoordinates.y + 1)
    let rangeX = (oldCoordinates.x.rawValue - 1)...(oldCoordinates.x.rawValue + 1)
    
    return !(rangeY.contains(newCoordinates.y) && rangeX.contains(newCoordinates.x.rawValue))
            
}

func checkNewKnightCoordinates(color: ChessFigure.Color,
                             newCoordinates: (x: ChessFigure.XValue, y: UInt),
                             oldCoordinates: (x: ChessFigure.XValue, y: UInt)) -> Bool {
    
    var acceptableCoordinates: [(x: ChessFigure.XValue, y: UInt)] = []
    for value in (oldCoordinates.y - 2)...(oldCoordinates.y + 2) {
        var operand = 0
        if value == oldCoordinates.y || value > 8 || value < 1 {
            continue
        } else if value == (oldCoordinates.y + 1) || value == (oldCoordinates.y - 1) {
            operand = 2
        } else {
            operand = 1
        }
        
        if let valueX = ChessFigure.XValue.init(rawValue: oldCoordinates.x.rawValue + operand) {
            acceptableCoordinates.append((valueX, value))
        }
        
        if let valueX = ChessFigure.XValue.init(rawValue: oldCoordinates.x.rawValue - operand) {
            acceptableCoordinates.append((valueX, value))
        }
    }
    
    return !acceptableCoordinates.contains { $0.x == newCoordinates.x && $0.y == newCoordinates.y }
            
}

func checkNewBishopCoordinates(color: ChessFigure.Color,
                             newCoordinates: (x: ChessFigure.XValue, y: UInt),
                             oldCoordinates: (x: ChessFigure.XValue, y: UInt)) -> Bool {
    
    var acceptableCoordinates: [(x: Int, y: UInt)] = []

    var newY = oldCoordinates.y + 1
    var newX = oldCoordinates.x.rawValue + 1
    
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
            newY = oldCoordinates.y - 1
            newX = oldCoordinates.x.rawValue
        } else {
            break
        }
        newX += 1
        if direction && newX == 0 {
            newX = oldCoordinates.x.rawValue + 1
            direction = false
            newY = oldCoordinates.y - 1
        }
    }
    
    newY = oldCoordinates.y + 1
    newX = oldCoordinates.x.rawValue - 1
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
            newY = oldCoordinates.y - 1
            newX = oldCoordinates.x.rawValue
        } else {
            break
        }
        newX -= 1
        if direction && newX == 0 {
            newX = oldCoordinates.x.rawValue - 1
            direction = false
            newY = oldCoordinates.y - 1
        }
    }
    
    return !acceptableCoordinates.contains { $0.x == newCoordinates.x.rawValue && $0.y == newCoordinates.y }
            
}

func checkNewQueenCoordinates(color: ChessFigure.Color,
                             newCoordinates: (x: ChessFigure.XValue, y: UInt),
                             oldCoordinates: (x: ChessFigure.XValue, y: UInt)) -> Bool {
    
    if !checkNewBishopCoordinates(color: color, newCoordinates: newCoordinates, oldCoordinates: oldCoordinates) {
        return false
    }
    
    if !checkNewKnightCoordinates(color: color, newCoordinates: newCoordinates, oldCoordinates: oldCoordinates) {
        return false
    }
    
    if !checkNewRookCoordinates(color: color, newCoordinates: newCoordinates, oldCoordinates: oldCoordinates) {
        return false
    }
    
    return true
         
}

func setNewCoordinates(figure: inout ChessFigure, coordinates: (x: ChessFigure.XValue, y: UInt)) {
    
    var error = false
    
    switch figure {
    case let .bishop(color, x, y):
       
        error = checkNewBishopCoordinates(color: color, newCoordinates: coordinates, oldCoordinates: (x, y))
        if !error {
            figure = .bishop(color: color, x: coordinates.x, y: coordinates.y)
        }
        
    case let .queen(color, x, y):
        
        error = checkNewQueenCoordinates(color: color, newCoordinates: coordinates, oldCoordinates: (x, y))
        if !error {
            figure = .queen(color: color, x: coordinates.x, y: coordinates.y)
        }
        
    case let .knight(color, x, y):
        
        error = checkNewKnightCoordinates(color: color, newCoordinates: coordinates, oldCoordinates: (x, y))
        if !error {
            figure = .knight(color: color, x: coordinates.x, y: coordinates.y)
        }
    
    case let .king(color, x, y):
        
        error = checkNewKingCoordinates(color: color, newCoordinates: coordinates, oldCoordinates: (x, y))
        if !error {
            figure = .king(color: color, x: coordinates.x, y: coordinates.y)
        }
        
    case let .pawn(color, x, y):
        
        error = checkNewPawnCoordinates(color: color, newCoordinates: coordinates, oldCoordinates: (x, y))
        if !error {
            figure = .pawn(color: color, x: x, y: coordinates.y)
        }

    case let .rook(color, x, y):
        
        error = checkNewRookCoordinates(color: color, newCoordinates: coordinates, oldCoordinates: (x, y))
        
        if !error {
            figure = ChessFigure.rook(color: color, x: coordinates.x, y: coordinates.y)
        }
    }
    
    if error {
        print("Wrong coordinates !!!")
    }
}

setNewCoordinates(figure: &bishopWhite, coordinates: (ChessFigure.XValue.f, 8))
setNewCoordinates(figure: &queenWhite, coordinates: (ChessFigure.XValue.f, 4))
setNewCoordinates(figure: &kingBlack, coordinates: (ChessFigure.XValue.f, 4))
print("\n\n\n\n\n")

chessFigures = [kingWhite, bishopWhite, queenWhite, kingBlack]
drawChessDesk(figures: chessFigures)
