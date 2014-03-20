# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nojbot/version'

Gem::Specification.new do |spec|
  spec.name          = "nojbot"
  spec.version       = NojBot::VERSION
  spec.authors       = ["Manoj Dayaram, Joshua Bussdieker"]
  spec.email         = ["m@noj.cc"]
  spec.summary       = %q{Hipchat Robot for fun things.}
  spec.description   = %q{Hipchat Robot to encompass the essence that is noj's shenannigans."}
  spec.homepage      = "https://github.com/mdayaram/nojbot"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.files        << Dir[".bundle/**/*"]
  spec.files        << Dir["vendor/**/*"]
  spec.files        << Dir["public/**/*"]
  spec.files        << "JENKINS" if File.exists? "JENKINS"

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
