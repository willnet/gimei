# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe Gimei do
  before { @name = Gimei.new }

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

  describe '#female' do
    before { @name = Gimei.new(:female) }
    it '女性の名前が返ること' do
      assert_equal @name.first.gender, :female
    end
  end

  describe '#male' do
    before { @name = Gimei.new(:male) }
    it '男性の名前が返ること' do
      assert_equal @name.first.gender, :male
    end
  end
end

describe Gimei::First do
  before { @name = Gimei::First.new }

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

  describe '#female' do
    before { @name = Gimei::First.new(:female) }
    it '女性の名前が返ること' do
      assert_equal @name.gender, :female
    end
  end

  describe '#male' do
    before { @name = Gimei::First.new(:male) }
    it '男性の名前が返ること' do
      assert_equal @name.gender, :male
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
end

