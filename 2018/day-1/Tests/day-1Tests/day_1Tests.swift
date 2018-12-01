import XCTest
import class Foundation.Bundle

final class day_1Tests: XCTestCase {
    func testDay1WithExamplesFromDescription() throws {
        XCTAssertEqual(try outputOfBinary(withArgument: "+1\n+1\n-2"), "0\n")
    }

    func testDay1Step2() throws {
        let argument = [1, -2, 3, 1].compactMap({ String($0) }).joined(separator: "\n")
        XCTAssertEqual(try outputOfBinary(withArgument: argument), "2\n")
    }

    func testDay1WithNoArguments() throws {
        XCTAssertEqual(try outputOfBinary(), "No arguments are passed.\n")
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
        ("testDay1WithExamplesFromDescription", testDay1WithExamplesFromDescription),
        ("testDay1WithNoArguments", testDay1WithNoArguments)
    ]

    func outputOfBinary(withArgument argument: String? = nil) throws -> String {
        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            fatalError("Only available on macOS 10.13 and above")
        }

        let binary = productsDirectory.appendingPathComponent("day-1")

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
