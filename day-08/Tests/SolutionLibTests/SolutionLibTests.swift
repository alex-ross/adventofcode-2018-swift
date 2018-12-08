import XCTest
import class Foundation.Bundle
@testable import SolutionLib

class SolutionLibTests: XCTestCase {
    func testNodeWithoutChildNodes() {

        let node = Node(numbers: [0, 1, 99, 2, 1, 1])

        XCTAssertEqual(node.numberOfChildNodes, 0)
        XCTAssertEqual(node.numberOfMetadataEntries, 1)
        XCTAssertEqual(node.length, 3)
        XCTAssertEqual(node.metadataEntries, [99])
    }

    func testNodeWithOneChildNode() {
        let node = Node(numbers: [1, 1, 0, 1, 99, 2, 1, 1])

        XCTAssertEqual(node.numberOfChildNodes, 1)
        XCTAssertEqual(node.numberOfMetadataEntries, 1)
        XCTAssertEqual(node.length, 6)

        XCTAssertEqual(node.childNodes.count, 1)
        XCTAssertEqual(node.childNodes.first?.numberOfChildNodes, 0)
        XCTAssertEqual(node.childNodes.first?.numberOfMetadataEntries, 1)
        XCTAssertEqual(node.childNodes.first?.metadataEntries, [99])




        XCTAssertEqual(node.metadataEntries, [2])
    }

    func testWithMultipleAndNestedChilds() {
        let node = Node(numbers: [2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2])

        XCTAssertEqual(node.numberOfChildNodes, 2)
        XCTAssertEqual(node.numberOfMetadataEntries, 3)
        XCTAssertEqual(node.length, 16)
        XCTAssertEqual(node.metadataSum, 138)

        XCTAssertEqual(node.metadataEntries, [1, 1, 2])
    }
}
