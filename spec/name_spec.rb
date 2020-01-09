# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe Gimei::Name do
  describe '.male' do
    before { @name = Gimei::Name.male }

    it 'Gimei::Name オブジェクトが返ること' do
      _(@name).must_be_instance_of Gimei::Name
    end

    it '#gender が :male を返すこと' do
      _(@name.gender).must_equal :male
    end

    it '#male? が true を返すこと' do
      _(@name.male?).must_equal true
    end
  end

  describe '.female' do
    before { @name = Gimei::Name.female }

    it 'Gimei::Name オブジェクトが返ること' do
      _(@name).must_be_instance_of Gimei::Name
    end

    it '#gender が :female を返すこと' do
      _(@name.gender).must_equal :female
    end

    it '#female? が true を返すこと' do
      _(@name.female?).must_equal true
    end
  end

  describe '.kanji' do
    it '全角文字とスペースが返ること' do
      _(Gimei::Name.kanji).must_match(/\A#{zenkaku_or_space_regexp}+\z/)
    end
  end

  describe '.hiragana' do
    it 'ひらがなとスペースが返ること' do
      _(Gimei::Name.hiragana).must_match(/\A[\p{hiragana}\s]+\z/)
    end
  end

  describe '.katakana' do
    it 'カタカナとスペースが返ること' do
      _(Gimei::Name.katakana).must_match(/\A[\p{katakana}\s]+\z/)
    end
  end

  describe '.romaji' do
    it 'ローマ字とスペースが返ること' do
      _(Gimei::Name.romaji).must_match(/\A[a-zA-Z\s]+\z/)
    end
  end

  describe '#gender' do
    it ':male または :female が返ること' do
      _(Gimei::Name.new.gender).must_be_instance_of(Symbol)
      _(Gimei::Name.new.gender.to_s).must_match(/\A(?:male|female)\Z/)
    end
  end

  describe '#kanji' do
    it '全角文字とスペースが返ること' do
      _(Gimei::Name.new.kanji).must_match(/\A#{zenkaku_or_space_regexp}+\z/)
    end
  end

  describe '#hiragana' do
    it 'ひらがなとスペースが返ること' do
      _(Gimei::Name.new.hiragana).must_match(/\A[\p{hiragana}\s]+\z/)
    end
  end

  describe '#katakana' do
    it 'カタカナとスペースが返ること' do
      _(Gimei::Name.new.katakana).must_match(/\A[\p{katakana}\s]+\z/)
    end
  end

  describe '#first' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      _(Gimei::Name.new.first).must_be_instance_of Gimei::Name::First
    end
  end

  describe '#last' do
    it 'Gimei::Name::Last オブジェクトが返ること' do
      _(Gimei::Name.new.last).must_be_instance_of Gimei::Name::Last
    end
  end

  describe '.romaji' do
    it 'ローマ字とスペースが返ること' do
      _(Gimei::Name.new.romaji).must_match(/\A[a-zA-Z\s]+\z/)
    end
  end
end

describe Gimei::Name::First do
  describe '.male' do
    before { @name = Gimei::Name::First.male }

    it 'Gimei::Name::First オブジェクトが返ること' do
      _(@name).must_be_instance_of Gimei::Name::First
    end

    it '#male? が true を返すこと' do
      _(@name.male?).must_equal true
    end
  end

  describe '.female' do
    before { @name = Gimei::Name::First.female }

    it 'Gimei::Name::First オブジェクトが返ること' do
      _(@name).must_be_instance_of Gimei::Name::First
    end

    it '#female? が true を返すこと' do
      _(@name.female?).must_equal true
    end
  end

  describe '#kanji' do
    it '全角文字が返ること' do
      _(Gimei::Name::First.new.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
    end
  end

  describe '#hiragana' do
    it 'ひらがなが返ること' do
      _(Gimei::Name::First.new.hiragana).must_match(/\A\p{hiragana}+\z/)
    end
  end

  describe '#katakana' do
    it 'カタカナが返ること' do
      _(Gimei::Name::First.new.katakana).must_match(/\A\p{katakana}+\z/)
    end
  end

  describe '#to_s' do
    it '全角文字が返ること' do
      _(Gimei::Name::First.new.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
    end
  end

  describe '#romaji' do
    it 'アルファベットで返ること' do
      _(Gimei::Name::First.new.romaji).must_match(/\A[a-zA-Z]+\z/)
    end
  end
end

describe Gimei::Name::Last do
  before { @name = Gimei::Name::Last.new }

  describe '#kanji' do
    it '全角文字が返ること' do
      _(@name.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
    end
  end

  describe '#hiragana' do
    it 'ひらがなが返ること' do
      _(@name.hiragana).must_match(/\A\p{hiragana}+\z/)
    end
  end

  describe '#katakana' do
    it 'カタカナが返ること' do
      _(@name.katakana).must_match(/\A\p{katakana}+\z/)
    end
  end

  describe '#to_s' do
    it '全角文字が返ること' do
      _(@name.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
    end
  end

  describe '#romaji' do
    it 'アルファベットで返ること' do
      _(Gimei::Name::First.new.romaji).must_match(/\A[a-z|A-Z]+\z/)
    end
  end
end
