// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS extensions",
    platforms: [ .iOS(.v11)],
    products: [
        .library(
            name: "ios_extensions",
            targets: ["ios_extensions"]),
    ],
    targets: [
        .target( name: "ios_extensions", dependencies: []),
        .testTarget( name: "ios_extensionsTests", dependencies: ["ios_extensions"]),
    ]
)
