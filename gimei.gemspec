# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gimei/version'

Gem::Specification.new do |gem|
  gem.name          = "gimei"
  gem.version       = Gimei::VERSION
  gem.authors       = ["willnet"]
  gem.email         = ["netwillnet@gmail.com"]
  gem.license       = "MIT"
  gem.description   = %q{random Japanese name and address generator}
  gem.summary       = %q{random Japanese name and address generator. support kanji, hiragana, and katakana}
  gem.homepage      = "https://github.com/willnet/gimei"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('romaji')
  gem.add_development_dependency('rake')
  gem.add_development_dependency('minitest')
  gem.add_development_dependency('coveralls')
end
