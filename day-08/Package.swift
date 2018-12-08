// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Solution",
    dependencies: [
        .package(path: "../AdventOfCode"),
    ],
    targets: [
        .target(
            name: "SolutionLib",
            dependencies: ["AdventOfCode"]),
        .testTarget(
            name: "SolutionLibTests",
            dependencies: ["SolutionLib"]),
        .target(
            name: "Solution",
            dependencies: ["SolutionLib", "AdventOfCode"]),
        .testTarget(
            name: "SolutionTests",
            dependencies: ["Solution"]),
    ]
)
