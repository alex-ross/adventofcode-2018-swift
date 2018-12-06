import Foundation
import AdventOfCode
import SolutionLib

AdventOfCode.exitIfNoArgumentsArePassed()

var safeCoordinates = AdventOfCode.normalizedCommandLineArguments.reduce([CoordinatePoint]()) { (result, string) -> [CoordinatePoint] in
    let coordinate = string.components(separatedBy: ", ").toIntegers()

    let x = coordinate.first!
    let y = coordinate.last!

    return result.appending(CoordinatePoint(x: x, y: y))
}

var grid = Grid(safeCoordinates: safeCoordinates)
var step1 = grid.sizeOfLargestArea()
var step2 = grid.sizeOfRegion(maxDistance: 10000)

print("Step 1: \(step1)")
print("Step 2: \(step2)")
