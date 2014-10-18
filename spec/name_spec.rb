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

  describe '.kanji' do
    it '全角文字とスペースが返ること' do
      Gimei.kanji.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '#hiragana' do
    before { @name = Gimei.new }

    it 'ひらがなとスペースが返ること' do
      @name.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '.hiragana' do
    it 'ひらがなとスペースが返ること' do
      Gimei.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '#katakana' do
    before { @name = Gimei.new }

    it 'カタカナとスペースが返ること' do
      @name.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end

  describe '.katakana' do
    it 'カタカナとスペースが返ること' do
      Gimei.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end

  describe '.first and .last' do
    before do
      unless self.class.const_defined?(:DATA_FILES)
        DATA_FILES = YAML.load_file(File.expand_path(File.join('..', '..', 'lib', 'data', 'names.yml'), __FILE__))
      end
      @last_names   = DATA_FILES['last_name'].map { |df| df[0] }
      @first_names  = DATA_FILES['first_name']['male'].map { |male| male[0] }
      @first_names +=
        DATA_FILES['first_name']['female'].map { |female| female[0] }
      @gimei_first  = Gimei.first
      @gimei_last   = Gimei.last
    end

    describe '.first' do
      it '苗字が含まれていないこと' do
        @last_names.include?(@gimei_first.kanji).must_equal false
      end

      it '名前が含まれていること' do
        @first_names.include?(@gimei_first.kanji).must_equal true
      end
    end

    describe '.last' do
      it '苗字が含まれていること' do
        @last_names.include?(@gimei_last.kanji).must_equal true
      end

      it '名前が含まれていないこと' do
        @first_names.include?(@gimei_last.kanji).must_equal false
      end
    end
  end

  describe '#to_s' do
    before { @name = Gimei.new }

    it '全角文字とスペースが返ること' do
      @name.to_s.must_match /\A[#{Moji.zen}\s]+\z/
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

