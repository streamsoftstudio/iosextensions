Pod::Spec.new do |s|
  s.name         = "ssiosextensions"
  s.version      = "1.0.0"
  s.summary      = "Collection of iOS extensions"
  s.description  = <<-DESC
    A lightweight collection of Foundation and UIKit extensions used across
    Streamsoft iOS projects: Date components, Array de-duplication, Data
    helpers (hex, CRC-32, chunking), Codable/JSON conveniences, URL
    validation, and UIKit helpers for UIColor, UIButton, UIImage and CALayer.
  DESC
  s.homepage     = "https://github.com/streamsoftstudio/iosextensions.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Andrija Milovanovic" => "andrija@streamsoft.rs" }
  s.ios.deployment_target = "13.0"
  s.source       = { :git => "https://github.com/streamsoftstudio/iosextensions.git", :tag => s.version.to_s }
  s.source_files = "Sources/**/*.swift"
  s.frameworks   = "Foundation", "UIKit"
  s.swift_version = "5.9"
end
