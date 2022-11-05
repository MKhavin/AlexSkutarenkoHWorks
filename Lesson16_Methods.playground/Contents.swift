import Foundation

enum Direction {
    case left, right, back, forward
}

struct Room {
    let width, height: Int
    let player: Player
    let boxes: [Box]
    
    func draw() {
        for y in 0...height + 1 {
            for x in 0...width + 1 {
                var symbol = ""
                
                switch (x, y) {
                case (let x, _) where x == 0 || x == (width + 1):
                    symbol = "\u{1FAA8}"
                case (_, let y) where y == 0 || y == (height + 1):
                    symbol = "\u{1FAA8}"
                default:
                    if (player.x, player.y) == (x, y) {
                        symbol = "\u{1F9CD}"
                    } else if boxes.first(where: { $0.x == x && $0.y == y }) != nil {
                        symbol = "\u{1F5C3}"
                    } else if (x, y) == (width, height) {
                        symbol = "\u{1F6AA}"
                    } else {
                        symbol = "\u{1F33F}"
                    }
                }
                
                print(symbol, separator: " ", terminator: "")
            }
            print()
        }
    }
    
    func movePlayer(direction: Direction) {
        let newCoordinates = player.getNewCoordinates(direction: direction, currentRoom: self)
        let currentBox = boxes.first {
            ($0.x, $0.y) == newCoordinates
        }
        
        var boxMoved = true
        if let box = currentBox {
            boxMoved = box.move(to: direction, in: self)
        }
        
        if boxMoved {
            player.moveTo(x: newCoordinates.x, y: newCoordinates.y)
        }
    }
}

class Player {
    var x, y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func move(to direction: Direction, in currentRoom: Room) {
        (x, y) = getNewCoordinates(direction: direction, currentRoom: currentRoom)
    }
    
    func moveTo(x: Int, y: Int) {
        (self.x, self.y) = (x, y)
    }
    
    func getNewCoordinates(direction: Direction, currentRoom: Room) -> (x: Int, y: Int) {
        var newValue = 0
        
        switch direction {
        case .left:
            newValue = x - 1
            return (verify(value: newValue, to: 0, by: .left) ? newValue : x, y)
        case .forward:
            newValue = y + 1
            return(x, verify(value: newValue, to: currentRoom.height, by: .forward) ? newValue : y)
        case .back:
            newValue = y - 1
            return(x, verify(value: newValue, to: 0, by: .back) ? newValue : y)
        case .right:
            newValue = x + 1
            return (verify(value: newValue, to: currentRoom.width, by: .right) ? newValue : x, y)
        }
    }
    
    private func verify(value: Int, to maxValue: Int, by condition: Direction) -> Bool {
        if condition == .left || condition == .back {
            return value >= maxValue
        } else {
            return value <= maxValue
        }
    }
}

class Box {
    var x, y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func move(to direction: Direction, in currentRoom: Room) -> Bool {
        var newValue = 0
        var result = false
        
        switch direction {
        case .left:
            newValue = x - 1
            result = verify(value: newValue, to: 0, by: .left)
            x = result ? newValue : x
        case .forward:
            newValue = y + 1
            result = verify(value: newValue, to: currentRoom.height, by: .forward)
            y = result ? newValue : y
        case .back:
            newValue = y - 1
            result = verify(value: newValue, to: 0, by: .back)
            y = result ? newValue : y
        case .right:
            newValue = x + 1
            result = verify(value: newValue, to: currentRoom.width, by: .right)
            x = result ? newValue : x
        }
        
        return result
    }
    
    private func verify(value: Int, to maxValue: Int, by condition: Direction) -> Bool {
        if condition == .left || condition == .back {
            return value >= maxValue
        } else {
            return value <= maxValue
        }
    }
}

let player = Player(x: 4, y: 4)
let box = Box(x: 3, y: 4)
let room = Room(width: 8, height: 8, player: player, boxes: [box])

room.draw()
room.movePlayer(direction: .left)
print()
room.draw()
room.movePlayer(direction: .back)
print()
room.draw()
room.movePlayer(direction: .left)
print()
room.draw()
room.movePlayer(direction: .forward)
print()
room.draw()
room.movePlayer(direction: .forward)
print()
room.draw()
room.movePlayer(direction: .forward)
print()
room.draw()
room.movePlayer(direction: .forward)
print()
room.draw()
room.movePlayer(direction: .forward)
print()
room.draw()
room.movePlayer(direction: .left)
print()
room.draw()
room.movePlayer(direction: .forward)
print()
room.draw()
room.movePlayer(direction: .right)
print()
room.draw()
room.movePlayer(direction: .right)
print()
room.draw()
room.movePlayer(direction: .right)
print()
room.draw()
room.movePlayer(direction: .right)
print()
room.draw()
room.movePlayer(direction: .right)
print()
room.draw()
room.movePlayer(direction: .right)
print()
room.draw()
