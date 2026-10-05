# iOS extensions

[![CI](https://github.com/streamsoftstudio/iosextensions/actions/workflows/ci.yml/badge.svg)](https://github.com/streamsoftstudio/iosextensions/actions/workflows/ci.yml)
[![Version](https://img.shields.io/cocoapods/v/ssiosextensions.svg)](https://cocoapods.org/pods/ssiosextensions)
[![License](https://img.shields.io/cocoapods/l/ssiosextensions.svg)](https://cocoapods.org/pods/ssiosextensions)
[![Platform](https://img.shields.io/cocoapods/p/ssiosextensions.svg)](https://cocoapods.org/pods/ssiosextensions)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)

A lightweight collection of Foundation and UIKit extensions we use across our iOS projects.

## Requirements

- iOS 13.0+
- Swift 5.9+

## Installation

### Swift Package Manager

Add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/streamsoftstudio/iosextensions.git", from: "1.0.0")
]
```

Or in Xcode: **File ▸ Add Package Dependencies…** and enter the repository URL.

### CocoaPods

```ruby
pod 'ssiosextensions'
```

## Usage

```swift
import IOSExtensions
```

### Date

```swift
let now = Date()
now.hour      // 14
now.minute    // 30
now.day       // 23
now.month     // 6
now.year      // 2026

// Same day, different time of day (nil if invalid):
let reminder = now.setting(hour: 18, minute: 45)
```

### Array (`Element: Hashable`)

```swift
[1, 2, 2, 3, 1].removingDuplicates()   // [1, 2, 3]

var values = [3, 3, 1, 2, 1]
values.removeDuplicates()              // [3, 1, 2]
```

### Data

```swift
let data = Data([0x0F, 0xAB, 0xFF])
data.hexadecimalString    // "0FABFF"
data.bytes                // [15, 171, 255]
data.bytes(from: 1)       // [171, 255]
data.crc                  // CRC-32 checksum
data.chunks(into: 2)      // [Data, Data]
```

### Codable / JSON

```swift
struct User: Codable { let id: Int; let name: String }
let user = User(id: 7, name: "streamsoft")

user.jsonString                 // "{\"id\":7,\"name\":\"streamsoft\"}"
user.dictionary                 // ["id": 7, "name": "streamsoft"]
let data = try user.encodedJSON()

let decoded = try User.decoded(from: data)
let fromString = User.decoded(from: jsonString)   // User?
let fromDict: User? = ["id": 7, "name": "x"].decoded()
```

### String

```swift
"https://streamsoft.rs".isValidURL   // true
"just some text".isValidURL          // false
```

### UIKit

```swift
UIWindow.isLandscape                         // Bool

UIColor(hex: "#FF8800")                      // UIColor?  (RGB or RGBA)
UIColor(hex: "FF8800CC")                     // UIColor?  (with alpha)

button.setBackgroundColor(.systemBlue, for: .highlighted)

let snapshot = UIImage.image(from: someView) // UIImage?

view.layer.addShadow(opacity: 0.3, radius: 4)
view.layer.addCorners([.topLeft, .topRight], radius: 12)

// A header laid out with Auto Layout, sized to the table's width; call it
// from viewDidLayoutSubviews.
tableView.sizeHeaderToFit()

// Content shows through this screen's navigation bar, as under a cover.
navigationItem.makeBarTransparent()
```

## License

`ssiosextensions` is available under the MIT license. See [LICENSE](LICENSE) for details.
