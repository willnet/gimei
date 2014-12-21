class Gimei::Last
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

  def to_s
    kanji
  end
end
