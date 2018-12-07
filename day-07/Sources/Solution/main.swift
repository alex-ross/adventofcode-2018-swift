import Foundation
import AdventOfCode
import SolutionLib

AdventOfCode.exitIfNoArgumentsArePassed()

var inputRows = AdventOfCode.normalizedCommandLineArguments.map(InputRow.init)

var step1 = SolutionLib.step1CompletionOrder(inputRows: inputRows)
var step2 = 0

print("Step 1: \(step1)")
print("Step 2: \(step2)")
