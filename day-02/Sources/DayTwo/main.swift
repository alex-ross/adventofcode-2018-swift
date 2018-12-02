import Foundation
import DayTwoLib

// First argument is always the name of the program. So we need atleast one more argument to proceed
if CommandLine.argc < 2 {
    print("No arguments are passed.")
    exit(ExitCode.error)
}

extension Array {
    func offset(_ offset: Int) -> [Element] {
        return [Element](self[offset..<count])
    }
}


extension Array where Element == String {
    func flatSplitElements(separator: Character) -> [Substring] {
        return self.flatMap({ $0.split(separator: separator) })
    }
}

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

