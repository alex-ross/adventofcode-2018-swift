import Foundation
import AdventOfCode

public struct SolutionLib {
}

public struct Node {
    let numberOfChildNodes: Int
    let numberOfMetadataEntries: Int
    let metadataEntries: [Int]
    let childNodes: [Node]
    let length: Int

    public let metadataSum: Int
    public let value: Int

    init(numbers: ArraySlice<Int>) {
        assert(numbers.count >= 3)
        numberOfChildNodes = numbers[numbers.startIndex + 0]
        let numberOfMetadataEntries = numbers[numbers.startIndex + 1]

        var childs = [Node]()
        var length = 2 + numberOfMetadataEntries
        var metadataSum = 0

        numberOfChildNodes.times { _ in
            let childNode = Node(numbers: numbers.suffix(from: numbers.startIndex + length - numberOfMetadataEntries))

            length += childNode.length
            metadataSum += childNode.metadataSum

            childs.append(childNode)
        }

        self.childNodes = childs
        self.length = length
        self.numberOfMetadataEntries = numberOfMetadataEntries


        let suffix = numbers.startIndex + length - numberOfMetadataEntries
        metadataEntries = numbers.suffix(from: suffix).prefix(numberOfMetadataEntries).map({ Int($0) })
        self.metadataSum = metadataEntries.reduce(metadataSum, +)


        // Step 2
        if childs.isEmpty {
            // Step 2: The value is the sum of it's metadata if it has no childs
            self.value = metadataEntries.reduce(0, +)
        } else {
            // Step 2: With childs the metadata is indexes (starting with 1 for first child)
            self.value = metadataEntries.filter({ $0 <= childs.count }).map({ childs[$0 - 1].value }).reduce(0, +)
        }
    }

    public init(numbers: [Int]) {
        self.init(numbers: numbers.suffix(from: 0))
    }
}
