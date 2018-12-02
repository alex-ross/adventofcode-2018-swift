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

    func testBoxesWithOnlyOneCharacterDifferentAtSamePosition() {
        let similarBox1 = BoxId("fguij")
        let similarBox2 = BoxId("fghij")
        let boxList = BoxList(boxes: [
            .init("abcde"),
            similarBox1,
            .init("klmno"),
            .init("pqrst"),
            similarBox2,
            .init("axcye"),
            .init("wvxyz"),
        ])

        XCTAssertEqual(2, boxList.boxesWithOnlyOneCharacterDifferentAtSamePosition.count)
        XCTAssertTrue(boxList.boxesWithOnlyOneCharacterDifferentAtSamePosition.contains(where: { $0 == similarBox1 }))
        XCTAssertTrue(boxList.boxesWithOnlyOneCharacterDifferentAtSamePosition.contains(where: { $0 == similarBox2 }))
    }

    static var allTests = [
        ("testChecksum", testChecksum)
    ]
}

