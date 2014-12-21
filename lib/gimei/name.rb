class Gimei::Name
  attr_reader :first, :last

  class << self
    extend Forwardable
    def_delegators :new, :kanji, :hiragana, :katakana, :first, :last

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

    def initialize(gender = nil)
      @gender = gender || Gimei::GENDER.sample
      @name = Gimei::NAMES['first_name'][@gender.to_s].sample
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

    alias_method :to_s, :kanji
  end

  class Last
    def initialize
      @name = Gimei::NAMES['last_name'].sample
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

    alias_method :to_s, :kanji
  end
end
