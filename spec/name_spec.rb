# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe Gimei do
  describe '.male' do
    before { @name = Gimei.male }

    it '男性の名前が返ること' do
      @name.male?.must_equal true
    end
  end

  describe '.female' do
    before { @name = Gimei.female }

    it '女性の名前が返ること' do
      @name.female?.must_equal true
    end
  end

  describe '#kanji' do
    before { @name = Gimei.new }

    it '全角文字とスペースが返ること' do
      @name.kanji.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '#hiragana' do
    before { @name = Gimei.new }

    it 'ひらがなとスペースが返ること' do
      @name.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '#katakana' do
    before { @name = Gimei.new }

    it 'カタカナとスペースが返ること' do
      @name.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end
end

describe Gimei::First do
  describe '.male' do
    before { @name = Gimei::First.male }

    it '男性の名前が返ること' do
      @name.male?.must_equal true
    end
  end

  describe '.female' do
    before { @name = Gimei::First.female }

    it '女性の名前が返ること' do
      @name.female?.must_equal true
    end
  end

  describe '#kanji' do
    before { @name = Gimei::First.new }

    it '全角文字が返ること' do
      @name.kanji.must_match /\A#{Moji.zen}+\z/
    end
  end

  describe '#hiragana' do
    before { @name = Gimei::First.new }

    it 'ひらがなが返ること' do
      @name.hiragana.must_match /\A\p{hiragana}+\z/
    end
  end

  describe '#katakana' do
    before { @name = Gimei::First.new }

    it 'カタカナが返ること' do
      @name.katakana.must_match /\A\p{katakana}+\z/
    end
  end

  describe '#to_s' do
    before { @name = Gimei::First.new }

    it '全角文字が返ること' do
      @name.to_s.must_match /\A#{Moji.zen}+\z/
    end
  end
end

describe Gimei::Last do
  before { @name = Gimei::Last.new }

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

