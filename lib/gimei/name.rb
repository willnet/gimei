require 'romaji'

class Gimei::Name
  attr_reader :first, :last

  class << self
    extend Forwardable
    def_delegators :new, :kanji, :hiragana, :katakana, :first, :last, :romaji

    def male
      new(:male)
    end

    def female
      new(:female)
    end
  end

  def initialize(gender = nil)
    @gender = gender || Gimei::GENDER.sample
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

  def romaji
    "#{first.romaji} #{last.romaji}"
  end

  def male?
    @gender == :male
  end

  def female?
    @gender == :female
  end

  alias_method :to_s, :kanji

  class First
    class << self
      def male
        new(:male)
      end

      def female
        new(:female)
      end
    end

    extend Forwardable
    def_delegators :@name, :kanji, :hiragana, :katakana, :to_s, :romaji

    def initialize(gender = nil)
      @gender = gender || Gimei::GENDER.sample
      @name = NameWord.new(Gimei::NAMES['first_name'][@gender.to_s].sample)
    end

    def male?
      @gender == :male
    end

    def female?
      @gender == :female
    end
  end

  class Last
    extend Forwardable
    def_delegators :@name, :kanji, :hiragana, :katakana, :to_s, :romaji

    def initialize
      @name = NameWord.new(Gimei::NAMES['last_name'].sample)
    end
  end

  class NameWord
    def initialize(name)
      @name = name
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

    def romaji
      Romaji.kana2romaji(hiragana).capitalize
    end

    alias_method :to_s, :kanji
  end
end
