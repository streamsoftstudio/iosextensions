// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IOSExtensions",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "IOSExtensions",
            targets: ["IOSExtensions"]
        ),
    ],
    targets: [
        .target(name: "IOSExtensions"),
        .testTarget(
            name: "IOSExtensionsTests",
            dependencies: ["IOSExtensions"]
        ),
    ]
)
