# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zipcode_zh_cn/version'

Gem::Specification.new do |spec|
  spec.name          = "zipcode_zh_cn"
  spec.version       = ZipcodeZhCn::VERSION
  spec.authors       = ["rubycat"]
  spec.email         = ["chenxueping1819@gmail.com"]

  spec.summary       = %q{Get zipcode for Mainland China by searching with address string}
  spec.description   = %q{Zipcode data is fetched from Baidu }
  spec.homepage      = "https://github.com/a598799539/zipcode_zh_cn"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "http", "~> 2.0"
  spec.add_development_dependency "nokogiri", "~> 1.6"
end
