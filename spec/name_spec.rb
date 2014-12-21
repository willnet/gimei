# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe Gimei::Name do
  describe '.male' do
    before { @name = Gimei::Name.male }

    it 'Gimei::Name オブジェクトが返ること' do
      @name.must_be_instance_of Gimei::Name
    end

    it '#male? が true を返すこと' do
      @name.male?.must_equal true
    end
  end

  describe '.female' do
    before { @name = Gimei::Name.female }

    it 'Gimei::Name オブジェクトが返ること' do
      @name.must_be_instance_of Gimei::Name
    end

    it '#female? が true を返すこと' do
      @name.female?.must_equal true
    end
  end

  describe '.kanji' do
    it '全角文字とスペースが返ること' do
      Gimei::Name.kanji.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '.hiragana' do
    it 'ひらがなとスペースが返ること' do
      Gimei::Name.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '.katakana' do
    it 'カタカナとスペースが返ること' do
      Gimei::Name.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end

  describe '#kanji' do
    it '全角文字とスペースが返ること' do
      Gimei::Name.new.kanji.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '#hiragana' do
    it 'ひらがなとスペースが返ること' do
      Gimei::Name.new.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '#katakana' do
    it 'カタカナとスペースが返ること' do
      Gimei::Name.new.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end

  describe '#first' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      Gimei::Name.new.first.must_be_instance_of Gimei::Name::First
    end
  end

  describe '#last' do
    it 'Gimei::Name::Last オブジェクトが返ること' do
      Gimei::Name.new.last.must_be_instance_of Gimei::Name::Last
    end
  end
end

describe Gimei::Name::First do
  describe '.male' do
    before { @name = Gimei::Name::First.male }

    it 'Gimei::Name::First オブジェクトが返ること' do
      @name.must_be_instance_of Gimei::Name::First
    end

    it '#male? が true を返すこと' do
      @name.male?.must_equal true
    end
  end

  describe '.female' do
    before { @name = Gimei::Name::First.female }

    it 'Gimei::Name::First オブジェクトが返ること' do
      @name.must_be_instance_of Gimei::Name::First
    end

    it '#female? が true を返すこと' do
      @name.female?.must_equal true
    end
  end

  describe '#kanji' do
    it '全角文字が返ること' do
      Gimei::Name::First.new.kanji.must_match /\A#{Moji.zen}+\z/
    end
  end

  describe '#hiragana' do
    it 'ひらがなが返ること' do
      Gimei::Name::First.new.hiragana.must_match /\A\p{hiragana}+\z/
    end
  end

  describe '#katakana' do
    it 'カタカナが返ること' do
      Gimei::Name::First.new.katakana.must_match /\A\p{katakana}+\z/
    end
  end

  describe '#to_s' do
    it '全角文字が返ること' do
      Gimei::Name::First.new.to_s.must_match /\A#{Moji.zen}+\z/
    end
  end
end

describe Gimei::Name::Last do
  before { @name = Gimei::Name::Last.new }

  describe '#kanji' do
    it '全角文字が返ること' do
      @name.kanji.must_match /\A#{Moji.zen}+\z/
    end
  end

  describe '#hiragana' do
    it 'ひらがなが返ること' do
      @name.hiragana.must_match /\A\p{hiragana}+\z/
    end
  end

  describe '#katakana' do
    it 'カタカナが返ること' do
      @name.katakana.must_match /\A\p{katakana}+\z/
    end
  end

  describe '#to_s' do
    it '全角文字が返ること' do
      @name.to_s.must_match /\A#{Moji.zen}+\z/
    end
  end
end
