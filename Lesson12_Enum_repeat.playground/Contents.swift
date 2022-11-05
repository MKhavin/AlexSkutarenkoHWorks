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

enum ChessFigure {
    var name: String {
        switch self {
        case .pawn(_, _, _): return "Pawn"
        case .king(_, _, _): return "King"
        case .rook(_, _, _): return "Rook"
        case .bishop(_, _, _): return "Bishop"
        case .knight(_, _, _): return "Knight"
        case .queen(_, _, _): return "Queen"
        }
    }
    
    var unicodeSymbol: Character {
        switch self {
        case .pawn(let color, _, _) where color == .black: return "\u{265F}"
        case .pawn(let color, _, _) where color == .white: return "\u{2659}"
        case .king(let color, _, _) where color == .black: return "\u{265A}"
        case .king(let color, _, _) where color == .white: return "\u{2654}"
        case .rook(let color, _, _) where color == .black: return "\u{265C}"
        case .rook(let color, _, _) where color == .white: return "\u{2656}"
        case .bishop(let color, _, _) where color == .black: return "\u{265D}"
        case .bishop(let color, _, _) where color == .white: return "\u{2657}"
        case .knight(let color, _, _) where color == .black: return "\u{265E}"
        case .knight(let color, _, _) where color == .white: return "\u{2658}"
        case .queen(let color, _, _) where color == .black: return "\u{265B}"
        case .queen(let color, _, _) where color == .white: return "\u{2655}"
        default: return Character("")
        }
    }
    
    case pawn(color: Color, row: Int, column: BoardColumnIdentifires)
    case knight(color: Color, row: Int, column: BoardColumnIdentifires)
    case bishop(color: Color, row: Int, column: BoardColumnIdentifires)
    case rook(color: Color, row: Int, column: BoardColumnIdentifires)
    case queen(color: Color, row: Int, column: BoardColumnIdentifires)
    case king(color: Color, row: Int, column: BoardColumnIdentifires)
    
    func getAssociatedValues() -> (color: String, row: Int, column: Character) {
        switch self {
        case let .pawn(color, row, column): return (color.rawValue, row, column.rawValue)
        case let .king(color, row, column): return (color.rawValue, row, column.rawValue)
        case let .rook(color, row, column): return (color.rawValue, row, column.rawValue)
        case let .bishop(color, row, column): return (color.rawValue, row, column.rawValue)
        case let .knight(color, row, column): return (color.rawValue, row, column.rawValue)
        case let .queen(color, row, column): return (color.rawValue, row, column.rawValue)
        }
    }
    
    func printFigureInfo() {
        let currentData = getAssociatedValues()
        print("Name: \(self.name)\nColor: \(currentData.color) \nCoordinates: (\(currentData.row),\(currentData.column))")
        print("----------------------------------------\n")
    }
    
    mutating func changeCoordinatesTo(row: Int, column: Character) {
        guard (1...8).contains(row), let currentColumn = BoardColumnIdentifires(rawValue: column) else {
            print("Invalid coordinates. Please, try again ! \n")
            return
        }
        
        switch self {
        case .pawn(let color, _, _): self = .pawn(color: color, row: row, column: currentColumn)
        case .king(let color, _, _): self = .king(color: color, row: row, column: currentColumn)
        case .rook(let color, _, _): self = .rook(color: color, row: row, column: currentColumn)
        case .bishop(let color, _, _): self = .bishop(color: color, row: row, column: currentColumn)
        case .knight(let color, _, _): self = .knight(color: color, row: row, column: currentColumn)
        case .queen(let color, _, _): self = .queen(color: color, row: row, column: currentColumn)
        }
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
                let data = $0.getAssociatedValues()
                return data.column == currentIndex.rawValue && data.row == row
            }
            
            if figure != nil {
                print("\(figure!.unicodeSymbol)", terminator: "")
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
    .rook(color: .white, row: 6, column: .a),
    .rook(color: .white, row: 5, column: .b),
    .king(color: .black, row: 8, column: .a)
]

figures.forEach { $0.printFigureInfo() }

drawChessBoard(figures: figures)
figures[0].changeCoordinatesTo(row: 2, column: "F")
figures[1].changeCoordinatesTo(row: 10, column: "F")
drawChessBoard(figures: figures)
