import Foundation

// First argument is always the name of the program. So we need atleast one more argument to proceed
if CommandLine.argc < 2 {
    print("No arguments are passed.")
    exit(ExitCode.error.rawValue)
}

let integers = CommandLine.arguments.offset(1).flatSplitElements(separator: "\n").toIntegers()

var frequencies = [0]

func reducer(result: Int, number: Int) -> Int {
    let frequency = result + number

    if frequencies.contains(frequency) {
        print(frequency)
        exit(ExitCode.success.rawValue)
    }

    frequencies.append(frequency)

    return result + number
}

while true {
    _ = integers.reduce(frequencies.last!, reducer)
}
