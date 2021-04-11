class Gimei::Address
  attr_reader :prefecture, :city, :town

  def initialize
    @prefecture = Prefecture.new
    @city = City.new
    @town = Town.new
  end

  def kanji
    "#{prefecture.kanji}#{city.kanji}#{town.kanji}"
  end

  def hiragana
    "#{prefecture.hiragana}#{city.hiragana}#{town.hiragana}"
  end

  def katakana
    "#{prefecture.katakana}#{city.katakana}#{town.katakana}"
  end

  def romaji
    "#{prefecture.romaji} #{city.romaji} #{town.romaji}"
  end

  alias_method :to_s, :kanji

  class Prefecture
    def kanji
      @prefectures[0]
    end

    def hiragana
      @prefectures[1]
    end

    def katakana
      @prefectures[2]
    end

    def romaji
      Romaji.kana2romaji(hiragana).capitalize
    end

    def initialize
      @prefectures = Gimei.addresses['addresses']['prefecture'].sample(random: Gimei.config.rng)
    end

    alias_method :to_s, :kanji
  end

  class City
    def kanji
      @cities[0]
    end

    def hiragana
      @cities[1]
    end

    def katakana
      @cities[2]
    end

    def romaji
      Romaji.kana2romaji(hiragana).capitalize
    end

    def initialize
      @cities = Gimei.addresses['addresses']['city'].sample(random: Gimei.config.rng)
    end

    alias_method :to_s, :kanji
  end

  class Town
    def kanji
      @towns[0]
    end

    def hiragana
      @towns[1]
    end

    def katakana
      @towns[2]
    end

    def romaji
      Romaji.kana2romaji(hiragana).capitalize
    end

    def initialize
      @towns = Gimei.addresses['addresses']['town'].sample(random: Gimei.config.rng)
    end

    alias_method :to_s, :kanji
  end
end
