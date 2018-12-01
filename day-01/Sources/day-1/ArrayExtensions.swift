import Foundation

extension Array {
    func offset(_ offset: Int) -> [Element] {
        return [Element](self[offset..<count])
    }
}

extension Array where Element == Substring {
    func toIntegers() -> [Int] {
        return self.compactMap({ Int($0) })
    }
}

extension Array where Element == String {
    func flatSplitElements(separator: Character) -> [Substring] {
        return self.flatMap({ $0.split(separator: separator) })
    }
}
