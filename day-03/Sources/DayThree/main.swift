import Foundation
import DayThreeLib
import AdventOfCode

AdventOfCode.exitIfNoArgumentsArePassed()

let claims = AdventOfCode.normalizedCommandLineArguments.map(Claim.init)

print("Step 1: \(DayThreeLib.numberOfSquareInchesWithTwoOrMoreClaims(inClaims: claims))")
print("Step 2: \(DayThreeLib.firstClaimNotOverlappingAnyOther(inClaims: claims)?.id ?? 0)")
