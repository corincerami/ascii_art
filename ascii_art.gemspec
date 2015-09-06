# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ascii_art/version'

Gem::Specification.new do |spec|
  spec.name          = "ascii_art"
  spec.version       = AsciiArt::VERSION
  spec.authors       = ["Chris C Cerami"]
  spec.email         = ["chrisccerami@gmail.com"]
  spec.date          = '2015-07-17'
  spec.summary       = "A command line app for drawing and saving ASCII art"
  spec.description   = "Using this gem, you can create ASCII style drawings in your command line, which you can choose to save to a .txt file."
  spec.homepage      = "http://rubygems.org/gems/ascii_art"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path  = "lib"

  spec.required_ruby_version = '~> 2.0'

  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'curses'
  spec.add_runtime_dependency 'commander', '~> 4.3'
end
