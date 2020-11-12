Pod::Spec.new do |s|
  s.name         = "ssiosextensions"
  s.version      = "0.9.0"
  s.summary      = "Collection of iOS extensions"
  s.homepage     = "https://github.com/streamsoftstudio/iosextensions.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Andrija Milovanovic" => "andrija@streamsoft.rs" }
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/streamsoftstudio/iosextensions.git", :tag => s.version.to_s }
  s.source_files = 'Sources/**/*.swift'
  s.frameworks  = "Foundation"
  s.swift_versions = ['5.0', '5.1']
end
