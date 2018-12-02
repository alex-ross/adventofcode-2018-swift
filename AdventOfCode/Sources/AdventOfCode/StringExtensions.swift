public extension String {
    func onlySameCharactersOnSamePosition(as string: String) -> String {
        var commonCharacters = [Character]()

        for (index, character) in self.enumerated() {
            if string.at(index: index) == character {
                commonCharacters.append(character)
            }
        }

        return String(commonCharacters)
    }

    func at(index: Int) -> Character? {
        let characters: [Character] = self.map({ $0 })
        guard index < self.count else { return nil }
        return characters[index]
    }
}

