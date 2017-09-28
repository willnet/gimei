# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe Gimei do
  describe '#kanji and #to_s' do
    it '全角文字が返ること' do
      Gimei.address.kanji.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.address.to_s.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.address.prefecture.kanji.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.address.prefecture.to_s.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.address.city.kanji.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.address.city.to_s.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.address.town.kanji.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.address.town.to_s.must_match(/\A[#{Moji.zen}]+\z/)

      Gimei.prefecture.kanji.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.prefecture.to_s.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.city.kanji.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.city.to_s.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.town.kanji.must_match(/\A[#{Moji.zen}]+\z/)
      Gimei.town.to_s.must_match(/\A[#{Moji.zen}]+\z/)
    end
  end

  describe '#hiragana' do
    it 'ひらがなが返ること' do
      Gimei.address.hiragana.must_match(/\A[\p{hiragana}]+\z/)
      Gimei.address.prefecture.hiragana.must_match(/\A[\p{hiragana}]+\z/)
      Gimei.address.city.hiragana.must_match(/\A[\p{hiragana}]+\z/)
      Gimei.address.town.hiragana.must_match(/\A[\p{hiragana}]+\z/)

      Gimei.prefecture.hiragana.must_match(/\A[\p{hiragana}]+\z/)
      Gimei.city.hiragana.must_match(/\A[\p{hiragana}]+\z/)
      Gimei.town.hiragana.must_match(/\A[\p{hiragana}]+\z/)
    end
  end

  describe '#katakana' do
    it 'カタカナが返ること' do
      Gimei.address.katakana.must_match(/\A[\p{katakana}]+\z/)
      Gimei.address.prefecture.katakana.must_match(/\A[\p{katakana}]+\z/)
      Gimei.address.city.katakana.must_match(/\A[\p{katakana}]+\z/)
      Gimei.address.town.katakana.must_match(/\A[\p{katakana}]+\z/)

      Gimei.prefecture.katakana.must_match(/\A[\p{katakana}]+\z/)
      Gimei.city.katakana.must_match(/\A[\p{katakana}]+\z/)
      Gimei.town.katakana.must_match(/\A[\p{katakana}]+\z/)
    end
  end

  describe '#romaji' do
    it 'ローマ字が返ること' do
      Gimei.address.romaji.must_match(/\A[a-zA-Z\s]+\z/)

      Gimei.address.prefecture.romaji.must_match(/\A[a-zA-Z]+\z/)
      Gimei.address.city.romaji.must_match(/\A[a-zA-Z]+\z/)
      Gimei.address.town.romaji.must_match(/\A[a-zA-Z]+\z/)

      Gimei.prefecture.romaji.must_match(/\A[a-zA-Z]+\z/)
      Gimei.city.romaji.must_match(/\A[a-zA-Z]+\z/)
      Gimei.town.romaji.must_match(/\A[a-zA-Z]+\z/)
    end
  end
end
