import Foundation

public class Claim {
    public let id: Int
    public let x: Int
    public let y: Int
    public let width: Int
    public let height: Int

    public init(row: String) {
        let characterSet = CharacterSet(charactersIn: "#@ x:,")

        let components = row.components(separatedBy: characterSet).compactMap(Int.init)
        id = components[0]
        x = components[1]
        y = components[2]
        width = components[3]
        height = components[4]
    }

    public lazy var squareInchesCoordinates: Set<String> = {
        let xRange = x..<(x + width)
        let yRange = y..<(y + height)

        var coordinates = Set<String>()

        for x in xRange {
            for y in yRange {
                coordinates.insert("\(x),\(y)")
            }
        }

        return coordinates
    }()
}
