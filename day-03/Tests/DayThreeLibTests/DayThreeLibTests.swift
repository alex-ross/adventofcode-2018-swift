import XCTest
import class Foundation.Bundle
@testable import DayThreeLib

class DayThreeLibTests: XCTestCase {
    func testClaimX() {
        XCTAssertEqual(515, Claim(row: "#1214 @ 515,933: 25x13").x)
    }

    func testClaimY() {
        XCTAssertEqual(933, Claim(row: "#1214 @ 515,933: 25x13").y)
    }

    func testClaimWidth() {
        XCTAssertEqual(25, Claim(row: "#1214 @ 515,933: 25x13").width)
    }

    func testClaimHeight() {
        XCTAssertEqual(13, Claim(row: "#1214 @ 515,933: 25x13").height)
    }

    func testSquareInchesCoordinates() {
        let claim = Claim(row: "#3 @ 5,5: 2x2")
        let expectedCoordinates: Set<String> = ["5,5", "5,6", "6,5", "6,6"]

        XCTAssertEqual(expectedCoordinates, claim.squareInchesCoordinates)
    }

    static var allTests = [
        ("testClaimX", testClaimX),
        ("testClaimY", testClaimY),
        ("testClaimWidth", testClaimWidth),
        ("testClaimHeight", testClaimHeight)
    ]
}
