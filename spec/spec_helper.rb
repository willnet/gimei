lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'gimei'

require 'bundler/setup'
require 'minitest/autorun'
require 'moji'
