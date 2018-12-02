import Foundation
import AdventOfCode

AdventOfCode.exitIfNoArgumentsArePassed()

let integers = CommandLine.arguments.offset(1).flatSplitElements(separator: "\n").toIntegers()

var frequencies = [0]

func reducer(result: Int, number: Int) -> Int {
    let frequency = result + number

    if frequencies.contains(frequency) {
        print(frequency)
        exit(ExitCode.success)
    }

    frequencies.append(frequency)

    return result + number
}

while true {
    _ = integers.reduce(frequencies.last!, reducer)
}
