# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe FakerJapanese::Name do
  before { @name = FakerJapanese::Name.new }

  describe '#kanji' do
    it '全角文字とスペースが返ること' do
      @name.kanji.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '#hiragana' do
    it 'ひらがなとスペースが返ること' do
      @name.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '#katakana' do
    it 'カタカナとスペースが返ること' do
      @name.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end
end

describe FakerJapanese::Name::First do
  before { @name = FakerJapanese::Name::First.new }

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
end

describe FakerJapanese::Name::Last do
  before { @name = FakerJapanese::Name::Last.new }

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
end

