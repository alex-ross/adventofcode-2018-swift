import Foundation

enum ExitCode: Int32 {
    case success = 0
    case error = 1
}

extension Array {
    func offset(_ offset: Int) -> [Element] {
        return [Element](self[offset..<count])
    }
}

// First argument is always the name of the program. So we need atleast one more argument to proceed
if CommandLine.argc < 2 {
    print("No arguments are passed.")
    exit(ExitCode.error.rawValue)
}

let integers = CommandLine.arguments.offset(1).flatMap { string in
    return string.split(separator: "\n").compactMap({ Int($0) })
}

let result = integers.reduce(0, +)

print(result)
