// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "fib",
    dependencies: [
        .package(
            url: "https://github.com/quickthyme/qloop.git",
            from: "0.1.4"),
        .package(
            url: "https://github.com/quickthyme/UIntfinity.git",
            from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "fib",
            dependencies: ["QLoop","UIntfinity"]),
        .testTarget(
            name: "fibTests",
            dependencies: ["fib"]),
    ]
)
