class Gimei::Address
  def initialize
    @prefecture = Prefecture.new
    @city = City.new
    @town = Town.new
  end

  def kanji
    "#{@prefecture.kanji}#{@city.kanji}#{@town.kanji}"
  end

  def to_s
    kanji
  end

  def prefecture
    @prefecture
  end

  def city
    @city
  end

  def town
    @town
  end

  class Prefecture
    def kanji
      @prefectures[0]
    end

    def to_s
      kanji
    end

    def hiragana
      @prefectures[1]
    end

    def katakana
      @prefectures[2]
    end

    def initialize
      @prefectures = Gimei::ADDRESSES['addresses']['prefecture'].sample
    end
  end

  class City
    def kanji
      @cities[0]
    end

    def to_s
      kanji
    end

    def hiragana
      @cities[1]
    end

    def katakana
      @cities[2]
    end

    def initialize
      @cities = Gimei::ADDRESSES['addresses']['city'].sample
    end
  end

  class Town
    def kanji
      @towns[0]
    end

    def to_s
      kanji
    end

    def hiragana
      @towns[1]
    end

    def katakana
      @towns[2]
    end

    def initialize
      @towns = Gimei::ADDRESSES['addresses']['town'].sample
    end
  end
end
