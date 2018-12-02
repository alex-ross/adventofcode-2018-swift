import Foundation

public struct BoxList {
    public let boxes: [BoxId]

    public init(boxes: [BoxId]) {
        self.boxes = boxes
    }

    public var checksum: Int {
        let numberOfBoxesWithLetters2Times = boxes.filter(lettersAppears2Times).count
        let numberOfBoxesWithLetters3Times = boxes.filter(lettersAppears3Times).count
        return numberOfBoxesWithLetters2Times * numberOfBoxesWithLetters3Times
    }

    private func lettersAppears2Times(boxId: BoxId) -> Bool {
        return !boxId.letters(whereNumberOfInstances: 2).isEmpty
    }

    private func lettersAppears3Times(boxId: BoxId) -> Bool {
        return !boxId.letters(whereNumberOfInstances: 3).isEmpty
    }
}
