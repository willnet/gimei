class Gimei::Name
  attr_reader :first, :last, :gender

  class << self
    extend Forwardable

    def male
      new(:male)
    end

    def female
      new(:female)
    end

    %i[kanji hiragana katakana romaji first last family given].each do |method_name|
      class_eval(<<~METHOD, __FILE__, __LINE__ + 1)
        def #{method_name}(gender = nil)
          new(gender).#{method_name}
        end
      METHOD
    end
  end

  def initialize(gender = nil)
    @gender = gender || Gimei::GENDERS.sample(random: Gimei.config.rng) #: :male | :female
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

  alias_method :family, :last
  alias_method :given, :first

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
      @gender = gender || Gimei::GENDERS.sample(random: Gimei.config.rng) #: :male | :female
      @name = NameWord.new(Gimei.names['first_name'][@gender.to_s].sample(random: Gimei.config.rng))
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
      name = Gimei.names['last_name'].sample(random: Gimei.config.rng)
      @name = NameWord.new(name)
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
      @name[3]
    end

    alias_method :to_s, :kanji
  end
end
