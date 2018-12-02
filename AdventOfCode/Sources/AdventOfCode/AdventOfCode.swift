import Foundation

public enum AdventOfCode {
    public static func exitIfNoArgumentsArePassed() {
        if CommandLine.argc < 2 {
            print("No arguments are passed.")
            exit(ExitCode.error)
        }
    }
}
