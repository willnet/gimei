lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bundler/setup'

require 'coveralls'
Coveralls.wear!

require 'gimei'
require 'minitest/autorun'
require 'moji'
