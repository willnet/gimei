require 'gimei/version'
require 'gimei/first'
require 'gimei/last'
require 'gimei/address'
require 'yaml'

class Gimei
  NAMES = YAML.load_file(File.expand_path(File.join('..', 'data', 'names.yml'), __FILE__))
  ADDRESSES = YAML.load_file(File.expand_path(File.join('..', 'data', 'addresses.yml'), __FILE__))
  GENDER = [:male, :female].freeze

  class << self
    def male
      new(:male)
    end

    def female
      new(:female)
    end

    def kanji
      name = new
      "#{name.last.kanji} #{name.first.kanji}"
    end

    def hiragana
      name = new
      "#{name.last.hiragana} #{name.first.hiragana}"
    end

    def katakana
      name = new
      "#{name.last.katakana} #{name.first.katakana}"
    end

    def first
      new.first
    end

    def last
      new.last
    end

    def address
      Address.new
    end

    def prefecture
      address.prefecture
    end

    def city
      address.city
    end

    def town
      address.town
    end
  end

  def initialize(gender = nil)
    @gender = gender || GENDER.sample
    @first = First.new @gender
    @last = Last.new
  end

  def kanji
    "#{last.kanji} #{first.kanji}"
  end

  def hiragana
    "#{last.hiragana} #{first.hiragana}"
  end

  def katakana
    "#{last.katakana} #{first.katakana}"
  end

  def to_s
    kanji
  end

  def first
    @first
  end

  def last
    @last
  end

  def male?
    @gender == :male
  end

  def female?
    @gender == :female
  end
end
