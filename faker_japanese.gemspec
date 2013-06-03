# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faker_japanese/version'

Gem::Specification.new do |gem|
  gem.name          = "faker_japanese"
  gem.version       = FakerJapanese::VERSION
  gem.authors       = ["willnet"]
  gem.email         = ["netwillnet@gmail.com"]
  gem.description   = %q{faker for japanese}
  gem.summary       = %q{faker for japanese}
  gem.homepage      = "https://github.com/willnet/faker_japanese"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
