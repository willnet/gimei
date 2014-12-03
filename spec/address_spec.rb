# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe Gimei do

  it '全角文字が返ること' do
    Gimei.kanji_prefectural.must_match /\A[#{Moji.zen}]+\z/
    Gimei.kanji_city.must_match /\A[#{Moji.zen}]+\z/
    Gimei.kanji_town.must_match /\A[#{Moji.zen}]+\z/
  end

  it '全角文字とスペースが返ること' do
    Gimei.kanji_address.must_match /\A[#{Moji.zen}]+ [#{Moji.zen}]+ [#{Moji.zen}]+\z/
  end

  it 'ひらがなが返ること' do
    Gimei.hiragana_prefectural.must_match /\A[\p{hiragana}]+\z/
    Gimei.hiragana_city.must_match /\A[\p{hiragana}]+\z/
    Gimei.hiragana_town.must_match /\A[\p{hiragana}]+\z/
  end

  it 'ひらがなとスペースが返ること' do
    Gimei.hiragana_address.must_match /\A[\p{hiragana}]+ [\p{hiragana}]+ [\p{hiragana}]+\z/
  end

  it 'カタカナが返ること' do
    Gimei.katakana_prefectural.must_match /\A[\p{katakana}]+\z/
    Gimei.katakana_city.must_match /\A[\p{katakana}]+\z/
    Gimei.katakana_town.must_match /\A[\p{katakana}]+\z/
  end

  it 'カタカナとスペースが返ること' do
    Gimei.katakana_address.must_match /\A[\p{katakana}]+ [\p{katakana}]+ [\p{katakana}]+\z/
  end

  describe '.kanji_prefectural' do
    before { @kanji_prefectural = Gimei.kanji_prefectural }
    it '全角文字が返ること' do
      @kanji_prefectural.must_match /\A[#{Moji.zen}]+\z/
    end
  end

  describe '.kanji_city' do
    before { @kanji_city = Gimei.kanji_city }
    it '全角文字が返ること' do
      @kanji_city.must_match /\A[#{Moji.zen}]+\z/
    end
  end

  describe '.kanji_town' do
    before { @kanji_town = Gimei.kanji_town }
    it '全角文字が返ること' do
      @kanji_town.must_match /\A[#{Moji.zen}]+\z/
    end
  end

  describe '.kanji_address' do
    before { @kanji_address = Gimei.kanji_address }
    it '全角文字とスペースが返ること' do
      @kanji_address.must_match /\A[#{Moji.zen}]+ [#{Moji.zen}]+ [#{Moji.zen}]+\z/
    end
  end

  describe '.hiragana_prefectural' do
    before { @hiragana_prefectural = Gimei.hiragana_prefectural }
    it 'ひらがなが返ること' do
      @hiragana_prefectural.must_match /\A[\p{hiragana}]+\z/
    end
  end

  describe '.hiragana_city' do
    before { @hiragana_city = Gimei.hiragana_city }
    it 'ひらがなが返ること' do
      @hiragana_city.must_match /\A[\p{hiragana}}]+\z/
    end
  end

  describe '.hiragana_town' do
    before { @hiragana_town = Gimei.hiragana_town }
    it 'ひらがなが返ること' do
      @hiragana_town.must_match /\A[\p{hiragana}]+\z/
    end
  end

  describe '.hiragana_address' do
    before { @hiragana_address = Gimei.hiragana_address }
    it 'ひらがなとスペースが返ること' do
      @hiragana_address.must_match /\A[\p{hiragana}]+ [\p{hiragana}]+ [\p{hiragana}]+\z/
    end
  end

  describe '.katakana_prefectural' do
    before { @katakana_prefectural = Gimei.katakana_prefectural }
    it 'カタカナが返ること' do
      @katakana_prefectural.must_match /\A[\p{katakana}]+\z/
    end
  end

  describe '.katakana_city' do
    before { @katakana_city = Gimei.katakana_city }
    it 'カタカナが返ること' do
      @katakana_city.must_match /\A[\p{katakana}}]+\z/
    end
  end

  describe '.katakana_town' do
    before { @katakana_town = Gimei.katakana_town }
    it 'カタカナが返ること' do
      @katakana_town.must_match /\A[\p{katakana}]+\z/
    end
  end

  describe '.katakana_address' do
    before { @katakana_address = Gimei.katakana_address }
    it 'カタカナとスペースが返ること' do
      @katakana_address.must_match /\A[\p{katakana}]+ [\p{katakana}]+ [\p{katakana}]+\z/
    end
  end
end
