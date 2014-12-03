require "gimei/version"
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

    def kanji_prefectural
      Address.new.kanji_prefectural
    end

    def kanji_city
      Address.new.kanji_city
    end

    def kanji_town
      Address.new.kanji_town
    end

    def kanji_address
      Address.new.kanji_address
    end

    def hiragana_prefectural
      Address.new.hiragana_prefectural
    end

    def hiragana_city
      Address.new.hiragana_city
    end

    def hiragana_town
      Address.new.hiragana_town
    end

    def hiragana_address
      Address.new.hiragana_address
    end

    def katakana_prefectural
      Address.new.katakana_prefectural
    end

    def katakana_city
      Address.new.katakana_city
    end

    def katakana_town
      Address.new.katakana_town
    end

    def katakana_address
      Address.new.katakana_address
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

  class Address
    def initialize
      @prefectural = ADDRESSES['addresses']['prefectural'].sample
      @city = ADDRESSES['addresses']['city'].sample
      @town = ADDRESSES['addresses']['town'].sample
    end

    def kanji_prefectural
      "#{@prefectural[0]}"
    end

    def kanji_city
      "#{@city[0]}"
    end

    def kanji_town
      "#{@town[0]}"
    end

    def kanji_address
      "#{@prefectural[0]} #{@city[0]} #{@town[0]}"
    end

    def hiragana_prefectural
      "#{@prefectural[1]}"
    end

    def hiragana_city
      "#{@city[1]}"
    end

    def hiragana_town
      "#{@town[1]}"
    end

    def hiragana_address
      "#{@prefectural[1]} #{@city[1]} #{@town[1]}"
    end

    def katakana_prefectural
      "#{@prefectural[2]}"
    end

    def katakana_city
      "#{@city[2]}"
    end

    def katakana_town
      "#{@town[2]}"
    end

    def katakana_address
      "#{@prefectural[2]} #{@city[2]} #{@town[2]}"
    end

    def to_s
      kanji_address
    end
  end
end
