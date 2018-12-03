public extension Array {
    func offset(_ offset: Int) -> [Element] {
        return [Element](self[offset..<count])
    }
}

public extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}

public extension Array where Element == String {
    func toIntegers() -> [Int] {
        return self.compactMap({ Int($0) })
    }
}
