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

    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in
            result.append(line)
        }
        return result
    }
}

public extension Character {
    public func swappedcased() -> Character {
        let lower = String(self).lowercased().first!
        if lower == self {
            return String(self).uppercased().first!
        } else {
            return lower
        }
    }
}

