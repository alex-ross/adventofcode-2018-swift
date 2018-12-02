import Foundation

public struct Box {


    public let id: Id

    public init(withId id: Id) {
        self.id = id
    }

    public init(withId id: String) {
        self.init(withId: Id(id))
    }
}

public struct Id {
    public let string: String

    public func letters(whereNumberOfInstances: Int) -> [String] {
        return [String]()
    }

    init(_ string: String) {
        self.string = string
    }
}
