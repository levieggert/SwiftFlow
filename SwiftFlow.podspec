Pod::Spec.new do |s|

  s.platform     = :ios, "9.0"

  s.name         = "SwiftFlow"
  s.version      = "1.0.0"
  s.license      = "MIT"

  s.homepage     = "https://github.com/levieggert/SwiftFlow"
  s.author       = { "levieggert" => "levi.eggert@gmail.com" }
  s.summary      = "Simple coordinator for app navigation.  Inspired by RxFlow."
  s.description  = "A simple swift library for handling app navigation. Inspired by RxFlow."

  s.source       = { :git => "https://github.com/levieggert/SwiftFlow.git", :tag => "#{s.version}" }

  s.source_files = 'Source/**/*.{h,m,swift}'
  s.swift_version = '5.0'
end
