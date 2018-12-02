import Foundation
import DayTwoLib
import AdventOfCode

AdventOfCode.exitIfNoArgumentsArePassed()

let boxIds = CommandLine
    .arguments
    .offset(1)
    .flatSplitElements(separator: "\n")
    .map({ String($0) })
    .map({ BoxId($0) })

let boxList = BoxList(boxes: boxIds)

print("Checksum: \(boxList.checksum)")
print("Similar boxes:")
boxList.boxesWithOnlyOneCharacterDifferentAtSamePosition.forEach({ print("  - \($0.string)") })
print("Answer is: \(boxList.commonLettersWithOnlyOneCharacterDifferantAtSamePosition)")

