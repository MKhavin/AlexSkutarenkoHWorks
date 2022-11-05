//Exercise 1
struct ChessBoard {
    enum ColumnValue: Int, CaseIterable {
        case a = 1
        case b, c, d, e, f, g, h
    }
    
    struct ChessCell: Comparable {
        
        let column: ColumnValue
        let row: Int
        
        static func == (lhs: ChessBoard.ChessCell, rhs: ChessBoard.ChessCell) -> Bool {
            return lhs.column == rhs.column && lhs.row == rhs.row
        }
        
        static func < (lhs: ChessBoard.ChessCell, rhs: ChessBoard.ChessCell) -> Bool {
            fatalError()
        }
    }
    
    var cells = [ChessCell]()
    
    init() {
        for row in 1...8 {
            for column in ColumnValue.allCases {
                cells.append(ChessCell(column: column, row: row))
            }
        }
    }
    
    subscript(column: ColumnValue, row: Int) -> String? {
        guard let value = cells.first(where: { $0.column == column && $0.row == row }) else {
            print("Wrong coordinates. Please try again !")
            return nil
        }
        
        return (value.column.rawValue + value.row) % 2 == 0 ? "Black" : "White"
    }
}

let board = ChessBoard()
print(board[ChessBoard.ColumnValue.e, 7] ?? "")
print(board[ChessBoard.ColumnValue.h, 10] ?? "")

//Exercise 2
struct TicTacToe {
    enum CellValue: String {
        case empty = "\u{25A2}"
        case cross = "\u{2573}"
        case nought = "\u{25CB}"
    }
    
    var cellsValue: [[CellValue]]
    
    init() {
        cellsValue = Array(repeating: Array(repeating: CellValue.empty, count: 3), count: 3)
    }
    
    func drawDesk() {
        for i in 0..<cellsValue.count {
            print("|", terminator: "")
            for value in cellsValue[i] {
                print(value.rawValue, terminator: "|")
            }
            print()
        }
    }
    
    func checkRowAndColumnValues(_ row: Int, and column: Int) -> Bool {
        let range = 0...3
        if range.contains(row) && range.contains(column) {
            return true
        } else {
            print()
            return false
        }
    }
    
    mutating func checkWinner(row: Int, column: Int) -> Bool {
        let currentValue = cellsValue[row][column]
        
        var isWinnerByColumn = true
        var isWinnerByRow = true
        var isWinnerByDiagonal = false
        
        for i in 0..<cellsValue.count {
            if cellsValue[row][i] != currentValue {
                isWinnerByRow = false
            }
            if cellsValue[i][column] != currentValue {
                isWinnerByColumn = false
            }
        }
        
        //temporary
        if (cellsValue[0][0] == currentValue && cellsValue[1][1] == currentValue && cellsValue[2][2] == currentValue)
            || (cellsValue[0][2] == currentValue && cellsValue[1][1] == currentValue && cellsValue[2][0] == currentValue) {
            isWinnerByDiagonal = true
        }
        
        let isWinner = isWinnerByRow || isWinnerByColumn || isWinnerByDiagonal
        if isWinner {
            print("Winner is \(currentValue.rawValue)")
            self = TicTacToe()
        }
        
        return isWinner
    }
    
    mutating func checkWinner() {
        var isDeskFull = true
        cellsValue.forEach {
            let isEmptyCell = $0.first(where: { $0 == .empty })
            if isEmptyCell != nil {
                isDeskFull = false
            }
        }
        
        if isDeskFull {
            print("No one is winner.")
            self = TicTacToe()
        }
    }
    
    subscript(row: Int, column: Int) -> CellValue? {
        get {
            guard checkRowAndColumnValues(row, and: column) else {
                return nil
            }
            
            return cellsValue[row][column]
        }
        set {
            guard let value = newValue, checkRowAndColumnValues(row, and: column) else {
                return
            }
            
            cellsValue[row][column] = value
            print()
            self.drawDesk()
            
            let isWinner = checkWinner(row: row, column: column)
            
            if !isWinner {
                checkWinner()
            }
        }
    }
}

var ticTacToe = TicTacToe()
ticTacToe.drawDesk()
ticTacToe[0, 0] = TicTacToe.CellValue.cross
ticTacToe[0, 1] = TicTacToe.CellValue.nought
ticTacToe[1, 0] = TicTacToe.CellValue.cross
ticTacToe[2, 0] = TicTacToe.CellValue.nought
ticTacToe[1, 1] = TicTacToe.CellValue.nought
ticTacToe[2, 2] = TicTacToe.CellValue.nought
ticTacToe[2, 1] = TicTacToe.CellValue.cross
ticTacToe[1, 2] = TicTacToe.CellValue.cross
ticTacToe[0, 2] = TicTacToe.CellValue.cross
