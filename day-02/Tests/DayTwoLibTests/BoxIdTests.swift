import XCTest
import class Foundation.Bundle
@testable import DayTwoLib

class BoxIdTests: XCTestCase {
    func testLettersWhereNumberOfInstances() {
        XCTAssertTrue(BoxId("abcdef").letters(whereNumberOfInstances: 2).isEmpty)
        XCTAssertTrue(BoxId("abcdef").letters(whereNumberOfInstances: 3).isEmpty)

        XCTAssertEqual(["a"], BoxId("bababc").letters(whereNumberOfInstances: 2))
        XCTAssertEqual(["b"], BoxId("bababc").letters(whereNumberOfInstances: 3))

        XCTAssertEqual(["b"], BoxId("abbcde").letters(whereNumberOfInstances: 2))
        XCTAssertTrue(BoxId("abbcde").letters(whereNumberOfInstances: 3).isEmpty)

        XCTAssertTrue(BoxId("abcccd").letters(whereNumberOfInstances: 2).isEmpty)
        XCTAssertEqual(["c"], BoxId("abcccd").letters(whereNumberOfInstances: 3))

        XCTAssertEqual(["a", "d"], BoxId("aabcdd").letters(whereNumberOfInstances: 2))

        XCTAssertEqual(["e"], BoxId("abcdee").letters(whereNumberOfInstances: 2))

        XCTAssertEqual(["a", "b"], BoxId("ababab").letters(whereNumberOfInstances: 3))
    }

    static var allTests = [
        ("testLettersWhereNumberOfInstances", testLettersWhereNumberOfInstances)
    ]
}
