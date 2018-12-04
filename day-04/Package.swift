// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DayFour",
    dependencies: [
        .package(path: "../AdventOfCode"),
    ],
    targets: [
        .target(
            name: "DayFourLib",
            dependencies: ["AdventOfCode"]),
        .testTarget(
            name: "DayFourLibTests",
            dependencies: ["DayFourLib"]),
        .target(
            name: "DayFour",
            dependencies: ["DayFourLib", "AdventOfCode"]),
        .testTarget(
            name: "DayFourTests",
            dependencies: ["DayFour"]),
    ]
)
