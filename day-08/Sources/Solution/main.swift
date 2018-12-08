import Foundation
import AdventOfCode
import SolutionLib

AdventOfCode.exitIfNoArgumentsArePassed()

var arguments = AdventOfCode.normalizedCommandLineArguments.flatMap({ $0.components(separatedBy: CharacterSet.whitespaces)}).compactMap(Int.init)

let node = Node(numbers: arguments)
var step1 = node.metadataSum
var step2 = node.value

print("Step 1: \(step1)")
print("Step 2: \(step2)")
