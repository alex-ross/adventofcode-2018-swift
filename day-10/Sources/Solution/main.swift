import Foundation
import AdventOfCode
import SolutionLib

AdventOfCode.exitIfNoArgumentsArePassed()

var characterSet = CharacterSet.decimalDigits
characterSet.insert(charactersIn: "-")

var arguments = AdventOfCode.normalizedCommandLineArguments
    .map({ $0.components(separatedBy: characterSet.inverted).compactMap(Int.init) })

assert(arguments.allSatisfy({ $0.count == 4 }))

struct Position {
    var x: Int
    var y: Int
}

class Point: Equatable {
    var position: Position
    var velocity: Position

    init(_ array: [Int]) {
        position = Position(x: array[0], y: array[1])
        velocity = Position(x: array[2], y: array[3])
    }

    func nextFrame() {
        position.x += velocity.x
        position.y += velocity.y
    }

    func hasNeighbor(in points: [Point]) -> Bool {
        let pointsToCompare = points.filter({ $0 != self })

        return pointsToCompare.anySatisfy { point -> Bool in
            let inX = [self.position.x - 1, self.position.x, self.position.x + 1].contains(point.position.x)
            let inY = [self.position.y - 1, self.position.y, self.position.y + 1].contains(point.position.y)
            return inX && inY
        }
    }

    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.position.x == rhs.position.x && lhs.position.y == rhs.position.y
    }
}

var points = arguments.map(Point.init)

func render(points: [Point]) -> String {
    var content = [String]()

    let xList = points.map({ $0.position.x })
    let xMin = xList.min()!
    let xMax = xList.max()!

    let yList = points.map({ $0.position.y })
    let yMin = yList.min()!
    let yMax = yList.max()!

    let xMargin = 6
    let xRange = (xMin - xMargin)...(xMax + xMargin)

    let yMargin = 4
    let yRange = (yMin - yMargin)...(yMax + yMargin)


    yRange.forEach { y in
        xRange.forEach { x in
            if points.first(where: { $0.position.x == x && $0.position.y == y }) != nil {
                content.append("#")
            } else {
                content.append(".")
            }
        }
        content.append("\n")
    }
    return content.joined()
}

var itteration = 0
while true {
    if points.allSatisfy({ $0.hasNeighbor(in: points) }) {
        print("Itterations: \(itteration)")
        print(render(points: points), terminator: "")
        exit(0)
    }
    points.forEach({ $0.nextFrame() })
    itteration += 1
}
