import Foundation
import AdventOfCode
import SolutionLib

AdventOfCode.exitIfNoArgumentsArePassed()

var arguments = AdventOfCode.normalizedCommandLineArguments.flatMap({ $0.components(separatedBy: CharacterSet.whitespaces)}).compactMap(Int.init)

var step1 = Node(numbers: arguments).metadataSum
var step2 = 0

print("Step 1: \(step1)")
print("Step 2: \(step2)")
