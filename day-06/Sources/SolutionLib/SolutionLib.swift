import Foundation
import AdventOfCode

public struct SolutionLib {
}

public struct CoordinatePoint: Equatable {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public var key: String {
        return "\(x)\(y)"
    }

    public func manhattanDistance(to: CoordinatePoint) -> Int {
        return abs(x - to.x) + abs(y - to.y)
    }

    public static func == (lhs: CoordinatePoint, rhs: CoordinatePoint) -> Bool {
        return lhs.key == rhs.key
    }
}

public class Grid {
    public let safeCoordinates: [CoordinatePoint]

    let xMin = 0
    let yMin = 0
    lazy var xMax: Int = { safeCoordinates.map({ $0.x }).max()! }()
    lazy var yMax: Int = { safeCoordinates.map({ $0.y }).max()! }()

    lazy var coordinates: [CoordinatePoint] = {
        var cordinatePoints = [CoordinatePoint]()

        for y in yMin...yMax {
            for x in xMin...(xMax + 1) {
                cordinatePoints.append(CoordinatePoint(x: x, y: y))
            }
        }

        return cordinatePoints
    }()

    public init(safeCoordinates: [CoordinatePoint]) {
        self.safeCoordinates = safeCoordinates
    }

    public func sizeOfRegion(maxDistance: Int = 32) -> Int {
        return coordinates.reduce(0, { (result, coordinate) -> Int in
            let distance = safeCoordinates.map({ coordinate.manhattanDistance(to: $0) }).reduce(0, +)
            guard distance < maxDistance else { return result }
            return result + 1
        })
    }

    public func sizeOfLargestArea() -> Int {
        var pointPoints = [String: [CoordinatePoint]]()

        for currentPoint in coordinates {
            let closestPoints = safeCoordinates.reduce([CoordinatePoint]()) { (result, point) -> [CoordinatePoint] in
                guard let previousPoint = result.last else { return [point] }

                let distance = point.manhattanDistance(to: currentPoint)
                let previousDistance = previousPoint.manhattanDistance(to: currentPoint)

                if distance == previousDistance {
                    return result.appending(point)
                }

                if distance < previousDistance {
                    return [point]
                }

                return result
            }

            if closestPoints.count < 2 {
                let point = closestPoints.first!
                pointPoints[point.key] = pointPoints[point.key]?.appending(currentPoint) ?? [currentPoint]
                continue
            }
        }

        return pointPoints
            .filter({ (group) -> Bool in
                let xValues = group.value.map({ $0.x })
                let yValues = group.value.map({ $0.y })

                let shoulNotdBeIncluded = xValues.min() == xMin || xValues.max() == xMax || yValues.min() == yMin || yValues.max() == yMax

                return !shoulNotdBeIncluded
            })
            .map({ $0.value.unique.count }).max()!
    }
}
