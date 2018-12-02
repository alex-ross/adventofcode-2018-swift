public struct BoxId: Equatable {
    public let string: String

    public init(_ string: String) {
        self.string = string
    }

    public func letters(whereNumberOfInstances numberOfInstances: Int) -> [Character] {
        let characters: [Character] = string.filter { character in
            return string.filter({ $0 == character }).count == numberOfInstances
        }

        return characters.unique.sorted()
    }

    public func differsOneCharacter(fromBoxId boxId: BoxId) -> Bool {
        return numberOfDifferentCharacters(fromBoxId: boxId) == 1
    }

    private func numberOfDifferentCharacters(fromBoxId boxId: BoxId) -> Int {
        return string.count - boxId.string.onlySameCharactersOnSamePosition(as: string).count
    }
}
