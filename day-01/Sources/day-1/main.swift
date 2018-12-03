import Foundation
import AdventOfCode

AdventOfCode.exitIfNoArgumentsArePassed()

let integers = AdventOfCode.normalizedCommandLineArguments.toIntegers()

var frequencies: Set = [0]

func reducer(result: Int, number: Int) -> Int {
    let frequency = result + number

    if frequencies.contains(frequency) {
        print(frequency)
        exit(ExitCode.success)
    }

    frequencies.insert(frequency)

    return result + number
}

while true {
    _ = integers.reduce(frequencies.max()!, reducer)
}
