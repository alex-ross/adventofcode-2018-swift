import Foundation
import AdventOfCode

public struct DayFourLib {

}

public struct LogRow {
    public let date: Date
    public let message: String

    public enum Event {
        case shiftStart
        case fallsAsleep
        case wakesUp
    }

    public init(string: String) {
        let components = string.components(separatedBy: .init(charactersIn: "[]"))

        date = Date(fromString: components[1],
                    withFormat: "yyyy-MM-dd HH:mm")!

        message = components[2].trimmingCharacters(in: .whitespacesAndNewlines)
    }

    public var event: Event {
        switch message {
            case "falls asleep":
                return .fallsAsleep
            case "wakes up":
                return .wakesUp
            default:
                return .shiftStart
        }
    }
}

public class Guard {
    public var logRows: [LogRow] = [LogRow]()
    public let id: Int

    public enum State {
        case wooken
        case sleeping
    }

    public static func id(fromString string: String) -> Int? {
        let integerParts = string.components(separatedBy: CharacterSet.decimalDigits.inverted)
        return Int(integerParts.joined())
    }

    public init(id: Int) {
        self.id = id
    }

    public lazy var mostCommonSleepyMinute: Int = {
        let grouped = Dictionary(grouping: sleepCycles.flatMap({ $0 }), by: { $0 })
        let max = grouped.max(by: { $0.value.count < $1.value.count })
        return max?.key ?? 0
    }()

    public lazy var numberOfTimesSleeptMostSleepyMinute: Int = {
        let grouped = Dictionary(grouping: sleepCycles.flatMap({ $0 }), by: { $0 })
        return grouped[mostCommonSleepyMinute, default: [Int]()].count
    }()

    public lazy var numberOfSleepyMinutes: Int = {
        return sleepCycles.flatMap({ $0 }).count
    }()

    public lazy var sleepCycles: [[Int]] = {
        var cycles = [[Int]]()
        var currentMinute = 0

        for logRow in logRows {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: logRow.date)

            guard let hour = components.hour, hour == 0 else { continue }

            switch logRow.event {
            case .fallsAsleep:
                currentMinute = components.minute ?? 0
            case .wakesUp:
                let minutes = (currentMinute..<(components.minute ?? 1)).map({ $0 })
                cycles.append(minutes)
            default:
                break
            }
        }

        return cycles
    }()


}
