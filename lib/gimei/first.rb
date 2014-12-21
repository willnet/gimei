class Gimei::First
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

  def to_s
    kanji
  end
end
