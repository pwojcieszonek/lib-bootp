lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lib/bootp/version"

Gem::Specification.new do |spec|
  spec.name          = "lib-bootp"
  spec.version       = Lib::BOOTP::VERSION
  spec.authors       = ["Piotr Wojcieszonek"]
  spec.email         = ["piotr@wojcieszonek.pl"]

  spec.summary       = %q{BOOTP protocol library}
  spec.description   = %q{Set of classes to low level handle the BOOTP protocol}
  spec.homepage      = "https://github.com/pwojcieszonek/lib-bootp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'net-address', '~> 0.2.3'

  spec.required_ruby_version = '>= 3.0.0'
end
