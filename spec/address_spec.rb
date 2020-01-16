# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe Gimei do
  describe '#kanji and #to_s' do
    it '全角文字が返ること' do
      _(Gimei.address.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.address.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.address.prefecture.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.address.prefecture.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.address.city.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.address.city.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.address.town.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.address.town.to_s).must_match(/\A#{zenkaku_regexp}+\z/)

      _(Gimei.prefecture.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.prefecture.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.city.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.city.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.town.kanji).must_match(/\A#{zenkaku_regexp}+\z/)
      _(Gimei.town.to_s).must_match(/\A#{zenkaku_regexp}+\z/)
    end
  end

  describe '#hiragana' do
    it 'ひらがなが返ること' do
      _(Gimei.address.hiragana).must_match(/\A[\p{hiragana}]+\z/)
      _(Gimei.address.prefecture.hiragana).must_match(/\A[\p{hiragana}]+\z/)
      _(Gimei.address.city.hiragana).must_match(/\A[\p{hiragana}]+\z/)
      _(Gimei.address.town.hiragana).must_match(/\A[\p{hiragana}]+\z/)

      _(Gimei.prefecture.hiragana).must_match(/\A[\p{hiragana}]+\z/)
      _(Gimei.city.hiragana).must_match(/\A[\p{hiragana}]+\z/)
      _(Gimei.town.hiragana).must_match(/\A[\p{hiragana}]+\z/)
    end
  end

  describe '#katakana' do
    it 'カタカナが返ること' do
      _(Gimei.address.katakana).must_match(/\A[\p{katakana}]+\z/)
      _(Gimei.address.prefecture.katakana).must_match(/\A[\p{katakana}]+\z/)
      _(Gimei.address.city.katakana).must_match(/\A[\p{katakana}]+\z/)
      _(Gimei.address.town.katakana).must_match(/\A[\p{katakana}]+\z/)

      _(Gimei.prefecture.katakana).must_match(/\A[\p{katakana}]+\z/)
      _(Gimei.city.katakana).must_match(/\A[\p{katakana}]+\z/)
      _(Gimei.town.katakana).must_match(/\A[\p{katakana}]+\z/)
    end
  end

  describe '#romaji' do
    it 'ローマ字が返ること' do
      _(Gimei.address.romaji).must_match(/\A[a-zA-Z\s]+\z/)

      _(Gimei.address.prefecture.romaji).must_match(/\A[a-zA-Z]+\z/)
      _(Gimei.address.city.romaji).must_match(/\A[a-zA-Z]+\z/)
      _(Gimei.address.town.romaji).must_match(/\A[a-zA-Z]+\z/)

      _(Gimei.prefecture.romaji).must_match(/\A[a-zA-Z]+\z/)
      _(Gimei.city.romaji).must_match(/\A[a-zA-Z]+\z/)
      _(Gimei.town.romaji).must_match(/\A[a-zA-Z]+\z/)
    end
  end
end
