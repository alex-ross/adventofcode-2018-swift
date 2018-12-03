import Foundation

public struct AdventOfCode {
    public static func exitIfNoArgumentsArePassed() {
        if CommandLine.argc < 2 {
            print("No arguments are passed.")
            exit(ExitCode.error)
        }
    }

    /**
     CommandLine.arguments will include the program name as the first string. To normalize the arguments this property
     will not include the first one. Advent Of Code will often have one input that separates each part with a row break,
     therefore we also split each new row and consider it to be a new argument.

     ## Example

     ```bash
     $ DayOne "foo\nbar" "lorem"
     ```

     Using the command below will get you the following results

     ```swift
     CommandLine.arguments
     # returns
     ["DayOne", "foo\nbar", "lorem"]

     AdventOfCode.normalizedCommandLineArguments
     # returns
     ["foo", "bar", "lorem"]
     ```
     */
    public static var normalizedCommandLineArguments: [String] = {
        return CommandLine.arguments.offset(1).flatMap({ $0.lines })
    }()
}
