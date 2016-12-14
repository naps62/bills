# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bills/version'

Gem::Specification.new do |spec|
  spec.name          = "bills"
  spec.version       = Bills::VERSION
  spec.authors       = ["Miguel Palhas"]
  spec.email         = ["mpalhas@gmail.com"]

  spec.summary       = %q{Categorizes my expenses/incomes}
  spec.description   = %q{Categorizes my expenses/incomes}
  spec.homepage      = "https://naps62.github.io/classifier"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "classifier-reborn", "2.0.4"
end
