# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_schema_matchers/version'

Gem::Specification.new do |spec|
  spec.name          = 'json_schema_matchers'
  spec.version       = JsonSchemaMatchers::VERSION
  spec.authors       = ["Football pools"]
  spec.email         = ["fp_onlineresults@thoughtworks.com"]
  spec.summary       = %q{Rspec matcher for JSON response validation}
  spec.description   = %q{See summary}
  spec.homepage      = "http://github.com/Sportech/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_development_dependency "rspec", "~> 3.5.0"

  spec.add_dependency "json-schema", "~> 2.7.0"
end
