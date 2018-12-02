import XCTest
import class Foundation.Bundle
@testable import DayTwoLib

class BoxListTests: XCTestCase {
    func testChecksum() {
        let boxList = BoxList(boxes: [
            .init("abcdef"),
            .init("bababc"),
            .init("abbcde"),
            .init("abcccd"),
            .init("aabcdd"),
            .init("abcdee"),
            .init("ababab")
        ])

        XCTAssertEqual(boxList.checksum, 12)
    }

    func testChecksum2() {
        let boxList = BoxList(boxes: [
            .init("bababc"),
            .init("abbcde"),
            .init("abcccd"),
            .init("aabcdd"),
            .init("abcdee"),
            .init("ababab")
            ])

        XCTAssertEqual(boxList.checksum, 12)
    }

    func testChecksum3() {
        let boxList = BoxList(boxes: [
            .init("bababc"),
            .init("abbcde"),
            .init("aabcdd"),
            .init("abcdee"),
            .init("ababab")
            ])

        XCTAssertEqual(boxList.checksum, 8)
    }

    static var allTests = [
        ("testChecksum", testChecksum)
    ]
}

