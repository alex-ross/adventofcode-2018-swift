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
    }

    public init(numbers: [Int]) {
        self.init(numbers: numbers.suffix(from: 0))
    }
}
