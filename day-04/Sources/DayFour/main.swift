import Foundation
import DayFourLib
import AdventOfCode

AdventOfCode.exitIfNoArgumentsArePassed()

let logRows = AdventOfCode.normalizedCommandLineArguments
    .map(LogRow.init)
    .sorted(by: { $0.date.compare($1.date) == .orderedAscending })

var guards: [Int: Guard] = [:]

var currentGuard = Guard(id: 0)

for row in logRows {
    switch row.event {
    case .fallsAsleep, .wakesUp:
        currentGuard.logRows.append(row)
    case .shiftStart:
        guard let id = Guard.id(fromString: row.message) else {
            fatalError("No id from row: \(row.message)")
        }
        if let existingGuard = guards[id] {
            currentGuard = existingGuard
        } else {
            let newGuard = Guard(id: id)
            guards[id] = newGuard
            currentGuard = newGuard
        }
    }
}

guard let step1Guard = guards.values.max(by: { $0.numberOfSleepyMinutes < $1.numberOfSleepyMinutes }) else {
    fatalError("No guard 1")
}
guard let step2Guard = guards.values.max(by: { $0.numberOfTimesSleeptMostSleepyMinute < $1.numberOfTimesSleeptMostSleepyMinute }) else {
    fatalError("No guard 2")
}

print("Step 1: \(step1Guard.id * step1Guard.mostCommonSleepyMinute)")
print("Step 2: \(step2Guard.id * step2Guard.mostCommonSleepyMinute)")
