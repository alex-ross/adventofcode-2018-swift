import XCTest
import class Foundation.Bundle
@testable import DayFourLib

class DayFourLibTests: XCTestCase {
    func testRowGuardBeginsShift() {
        let logRow = LogRow(string: "[1518-11-01 00:00] Guard #10 begins shift")

        XCTAssertEqual(date("1518-11-01 00:00"), logRow.date)
        XCTAssertEqual("Guard #10 begins shift", logRow.message)
    }

    func testRowFallsAsleep() {
        let logRow = LogRow(string: "[1518-11-01 00:05] falls asleep")

        XCTAssertEqual(date("1518-11-01 00:05"), logRow.date)
        XCTAssertEqual("falls asleep", logRow.message)
    }

    func testRowWakesUp() {
        let logRow = LogRow(string: "[1518-11-01 00:25] wakes up")

        XCTAssertEqual(date("1518-11-01 00:25"), logRow.date)
        XCTAssertEqual("wakes up", logRow.message)
    }

    func testGuardMostSleepyMinute() {
        let rows = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            "[1518-11-03 00:05] Guard #10 begins shift",
            "[1518-11-03 00:24] falls asleep",
            "[1518-11-03 00:29] wakes up",
        ].map(LogRow.init)

        let theGuard = Guard(id: 10)
        theGuard.logRows = rows
        XCTAssertEqual(24, theGuard.mostCommonSleepyMinute)
    }

    func testGuardNumberOfSleepyMinutes() {
        let rows = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            "[1518-11-03 00:05] Guard #10 begins shift",
            "[1518-11-03 00:24] falls asleep",
            "[1518-11-03 00:29] wakes up",
            ].map(LogRow.init)

        let theGuard = Guard(id: 10)
        theGuard.logRows = rows
        XCTAssertEqual(50, theGuard.numberOfSleepyMinutes)
    }

    func testGuardIdFromString() {
        let guardId = Guard.id(fromString: "Guard #10 begins shift")
        XCTAssertEqual(10, guardId)
    }

    func testGuardNumberOfTimesSleeptMostSleepyMinute() {
        let rows = [
            "[1518-11-01 00:00] Guard #10 begins shift",
            "[1518-11-01 00:05] falls asleep",
            "[1518-11-01 00:25] wakes up",
            "[1518-11-01 00:30] falls asleep",
            "[1518-11-01 00:55] wakes up",
            "[1518-11-03 00:05] Guard #10 begins shift",
            "[1518-11-03 00:24] falls asleep",
            "[1518-11-03 00:29] wakes up",
            ].map(LogRow.init)

        let theGuard = Guard(id: 10)
        theGuard.logRows = rows
        XCTAssertEqual(2, theGuard.numberOfTimesSleeptMostSleepyMinute)
    }

    static var allTests = [
        ("testRowGuardBeginsShift", testRowGuardBeginsShift),
    ]

    func date(_ string: String) -> Date {
        return Date(fromString: string, withFormat: "yyyy-MM-dd HH:mm")!
    }
}
