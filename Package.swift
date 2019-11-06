// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "unused-resources",
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50100.0")),
        .package(url: "https://github.com/mxcl/Path.swift.git", .exact("0.16.2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "unused-resources",
            dependencies: ["unused-resourcesKit", "Path"]),
        .target(
            name: "unused-resourcesKit",
            dependencies: ["SwiftSyntax", "Path"]),
        .testTarget(
            name: "unused-resourcesTests",
            dependencies: ["unused-resources"]),
    ]
)
