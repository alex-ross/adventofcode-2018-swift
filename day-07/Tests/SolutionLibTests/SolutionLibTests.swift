import XCTest
import class Foundation.Bundle
@testable import SolutionLib

class SolutionLibTests: XCTestCase {

    func testParseInputRow() {
        let row = InputRow("Step C must be finished before step A can begin.")
        XCTAssertEqual("A", row.step)
        XCTAssertEqual("C", row.dependsOnStep)
    }
}
