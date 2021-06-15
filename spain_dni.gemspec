
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spain_dni/version"

Gem::Specification.new do |spec|
  spec.name          = "spain_dni"
  spec.version       = SpainDni::VERSION
  spec.authors       = ["nevadajames"]
  spec.email         = ["nevadajames@gmail.com"]

  spec.summary       = %q{A gem to validate Spanish DNI/NIE numbers and generate fake ones}
  spec.description   = %q{This gem verifies the last letter or a DNI/NIE and has methods to generate fake ones for testing.}
  spec.homepage      = "https://github.com/nevadajames/spain_dni"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
