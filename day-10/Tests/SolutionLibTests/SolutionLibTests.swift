import XCTest
import class Foundation.Bundle
@testable import SolutionLib

class SolutionLibTests: XCTestCase {
    func testNodeWithoutChildNodes() {
        let nodeD = Node(numbers: [0, 1, 99, 2, 1, 1])

        XCTAssertEqual(nodeD.numberOfChildNodes, 0)
        XCTAssertEqual(nodeD.numberOfMetadataEntries, 1)
        XCTAssertEqual(nodeD.length, 3)
        XCTAssertEqual(nodeD.metadataEntries, [99])
        XCTAssertEqual(nodeD.value, 99)

        let nodeB = Node(numbers: [0, 3, 10, 11, 12])

        XCTAssertEqual(nodeB.numberOfChildNodes, 0)
        XCTAssertEqual(nodeB.numberOfMetadataEntries, 3)
        XCTAssertEqual(nodeB.length, 5)
        XCTAssertEqual(nodeB.metadataEntries, [10, 11, 12])
        XCTAssertEqual(nodeB.value, 33)
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

        // Step 2: It has one child but the metadata index is 2. This will then be 0 becouse no index exists on 2.
        XCTAssertEqual(node.value, 0)
    }

    func testWithMultipleAndNestedChilds() {
        let node = Node(numbers: [2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2])

        XCTAssertEqual(node.numberOfChildNodes, 2)
        XCTAssertEqual(node.numberOfMetadataEntries, 3)
        XCTAssertEqual(node.length, 16)
        XCTAssertEqual(node.metadataSum, 138)
        XCTAssertEqual(node.metadataEntries, [1, 1, 2])

        // Step 2: It has multiple childs and we should sum up value if index 1, 1 and 2 with will be 66
        XCTAssertEqual(node.value, 66)
    }
}
