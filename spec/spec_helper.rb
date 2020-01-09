lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bundler/setup'

require 'coveralls'
Coveralls.wear!

require 'gimei'
require 'minitest/autorun'

def zenkaku_regexp
  /\p{Hiragana}|\p{Katakana}|[一-龠々]/
end

def zenkaku_or_space_regexp
  /\p{Hiragana}|\p{Katakana}|[一-龠々]|\s/
end

