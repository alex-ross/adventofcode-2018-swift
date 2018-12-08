import XCTest
import class Foundation.Bundle

final class SolutionTests: XCTestCase {
    func testDay1WithNoArguments() throws {
        XCTAssertEqual(try outputOfBinary(), "No arguments are passed.\n")
    }

    func testExample() throws {
        let argument = """
        2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2
        """

        let expected = """
        Step 1: 138
        Step 2: 0

        """
        XCTAssertEqual(try outputOfBinary(withArgument: argument), expected)
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testExample", testExample),
    ]

    func outputOfBinary(withArgument argument: String? = nil) throws -> String {
        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            fatalError("Only available on macOS 10.13 and above")
        }

        let binary = productsDirectory.appendingPathComponent("Solution")

        let process = Process()
        process.executableURL = binary
        if let argument = argument {
            process.arguments = [argument]
        }

        let pipe = Pipe()
        process.standardOutput = pipe

        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8) else {
            fatalError("No string was generated at all")
        }

        return output
    }
}
