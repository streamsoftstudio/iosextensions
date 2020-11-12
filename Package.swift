// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS extensions",
    platforms: [ .iOS(.v11)],
    products: [
        .library(
            name: "IOSExtensions",
            targets: ["IOSExtensions"]),
    ]
    ,
    targets: [
        .target( name: "IOSExtensions", dependencies: []),
        .testTarget( name: "ios_extensionsTests", dependencies: ["IOSExtensions"]),
    ]
)
