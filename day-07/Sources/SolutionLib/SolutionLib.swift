import Foundation
import AdventOfCode

public struct SolutionLib {
    public static func step1CompletionOrder(inputRows: [InputRow]) -> String {
        var dependencyList = makeDependencyList(inputRows: inputRows)
        var characters = inputRows.flatMap { [ $0.step, $0.dependsOnStep] }.unique.sorted()
        var result = [Character]()

        while !characters.isEmpty {
            var skip = false

            for character in characters {
                if skip {
                    continue
                }

                guard let dependensies = dependencyList[character] else {
                    result.append(character)
                    characters.remove(at: characters.firstIndex(of: character)!)
                    skip = true
                    continue
                }

                let include = dependensies.reduce(true) { (include, character) -> Bool in
                    guard include else { return false }
                    guard result.contains(character) else { return false }
                    return true
                }

                if include {
                    result.append(character)
                    characters.remove(at: characters.firstIndex(of: character)!)
                    skip = true
                }
            }
        }

        return result.map { String($0) }.joined()
    }

    static func makeDependencyList(inputRows: [InputRow]) -> [Character: Set<Character>] {
        var dependencyList = [Character: Set<Character>]()

        for row in inputRows {
            if dependencyList[row.step] == nil {
                dependencyList[row.step] = Set<Character>()
            }

            dependencyList[row.step]!.insert(row.dependsOnStep)
        }

        return dependencyList
    }
}

public struct InputRow {
    public let step: Character
    public let dependsOnStep: Character

    public init(_ row: String) {
        if #available(OSX 10.13, *) {
            let matches = findStepAndDependencyFrom(text: row)
            step = matches.0!
            dependsOnStep = matches.1!
        } else {
            step = Character("_")
            dependsOnStep = Character("_")
        }
    }
}

@available(OSX 10.13, *)
fileprivate func findStepAndDependencyFrom(text: String) -> (Character?, Character?) {
    var step: Character?
    var dependsOnStep: Character?

    let pattern = "^Step\\s+(?<dependency>\\D+)\\s+must\\s+be\\s+finished\\s+before\\s+step\\s+(?<step>\\D+)"
    let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)

    if let match = regex?.firstMatch(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count)) {
        if let seasonRange = Range(match.range(withName: "step"), in: text) {
            step = String(text[seasonRange]).first
        }

        if let episodeRange = Range(match.range(withName: "dependency"), in: text) {
            dependsOnStep = String(text[episodeRange]).first
        }
    }

    return (step, dependsOnStep)
}
