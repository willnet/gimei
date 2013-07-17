require "gimei/version"
require 'yaml'

class Gimei
  NAMES = YAML.load_file(File.expand_path(File.join('..', 'data', 'names.yml'), __FILE__))
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

  class First
    class << self
      def male
        new(:male)
      end

      def female
        new(:female)
      end
    end

    def initialize(gender = nil)
      @gender = gender || GENDER.sample
      @name = NAMES['first_name'][@gender.to_s].sample
    end

    def male?
      @gender == :male
    end

    def female?
      @gender == :female
    end

    def kanji
      @name[0]
    end

    def hiragana
      @name[1]
    end

    def katakana
      @name[2]
    end

    def to_s
      kanji
    end
  end

  class Last
    def initialize
      @name = NAMES['last_name'].sample
    end

    def kanji
      @name[0]
    end

    def hiragana
      @name[1]
    end

    def katakana
      @name[2]
    end

    def to_s
      kanji
    end
  end
end
