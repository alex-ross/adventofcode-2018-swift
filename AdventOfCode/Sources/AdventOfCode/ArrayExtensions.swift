public extension Array {
    func offset(_ offset: Int) -> [Element] {
        return [Element](self[offset..<count])
    }

    /// Returns the array including the appended element
    func appending(_ newElement: Element)  -> [Element] {
        var array = self
        array.append(newElement)
        return array
    }

    func anySatisfy(_ predicate: (Element) -> Bool) -> Bool {
        return !self.allSatisfy { !predicate($0) }
    }
}

public extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}

public extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueItems = [Element]()

        for item in self {
            if !uniqueItems.contains(item) {
                uniqueItems.append(item)
            }
        }

        return uniqueItems
    }
}

public extension Array where Element == String {
    func toIntegers() -> [Int] {
        return self.compactMap({ Int($0) })
    }
}
