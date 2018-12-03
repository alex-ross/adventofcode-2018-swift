// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DayThree",
    dependencies: [
        .package(path: "../AdventOfCode"),
    ],
    targets: [
        .target(
            name: "DayThreeLib",
            dependencies: ["AdventOfCode"]),
        .testTarget(
            name: "DayThreeLibTests",
            dependencies: ["DayThreeLib"]),
        .target(
            name: "DayThree",
            dependencies: ["DayThreeLib", "AdventOfCode"]),
        .testTarget(
            name: "DayThreeTests",
            dependencies: ["DayThree"]),
    ]
)
