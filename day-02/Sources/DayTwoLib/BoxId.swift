public struct BoxId {
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
}
