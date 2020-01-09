# coding: utf-8
require_relative 'spec_helper'

describe Gimei do
  describe '.male' do
    before { @name = Gimei.male }

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
    before { @name = Gimei.female }

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

  describe '#gender' do
    it ':male または :female が返ること' do
      _(Gimei.new.gender).must_be_instance_of(Symbol)
      _(Gimei.new.gender.to_s).must_match(/\A(?:male|female)\Z/)
    end
  end

  describe '#kanji' do
    it '全角文字とスペースが返ること' do
      _(Gimei.new.kanji).must_match(/\A#{zenkaku_or_space_regexp}+\z/)
    end
  end

  describe '#to_s' do
    it '全角文字とスペースが返ること' do
      _(Gimei.new.to_s).must_match(/\A#{zenkaku_or_space_regexp}+\z/)
    end
  end

  describe '.kanji' do
    it '全角文字とスペースが返ること' do
      _(Gimei.kanji).must_match(/\A#{zenkaku_or_space_regexp}+\z/)
    end
  end

  describe '#hiragana' do
    it 'ひらがなとスペースが返ること' do
      _(Gimei.new.hiragana).must_match(/\A[\p{hiragana}\s]+\z/)
    end
  end

  describe '.hiragana' do
    it 'ひらがなとスペースが返ること' do
      _(Gimei.hiragana).must_match(/\A[\p{hiragana}\s]+\z/)
    end
  end

  describe '#katakana' do
    it 'カタカナとスペースが返ること' do
      _(Gimei.new.katakana).must_match(/\A[\p{katakana}\s]+\z/)
    end
  end

  describe '.katakana' do
    it 'カタカナとスペースが返ること' do
      _(Gimei.katakana).must_match(/\A[\p{katakana}\s]+\z/)
    end
  end

  describe '.name' do
    it 'Gimei::Name オブジェクトが返ること' do
      _(Gimei.name).must_be_instance_of Gimei::Name
    end
  end

  describe '#name' do
    it 'Gimei::Name オブジェクトが返ること' do
      _(Gimei.new.name).must_be_instance_of Gimei::Name
    end
  end

  describe '.first' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      _(Gimei.first).must_be_instance_of Gimei::Name::First
    end
  end

  describe '#first' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      _(Gimei.new.first).must_be_instance_of Gimei::Name::First
    end
  end

  describe '.last' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      _(Gimei.last).must_be_instance_of Gimei::Name::Last
    end
  end

  describe '#last' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      _(Gimei.new.last).must_be_instance_of Gimei::Name::Last
    end
  end

  describe '.romaji' do
    it 'ローマ字とスペースが返ること' do
      _(Gimei.romaji).must_match(/\A[a-zA-Z\s]+\z/)
    end
  end

  describe '#romaji' do
    it 'ローマ字とスペースが返ること' do
      _(Gimei.new.romaji).must_match(/\A[a-zA-Z\s]+\z/)
    end
  end

  describe '.address' do
    it 'Gimei::Address オブジェクトが返ること' do
      _(Gimei.address).must_be_instance_of Gimei::Address
    end
  end

  describe '#address' do
    it 'Gimei::Address オブジェクトが返ること' do
      _(Gimei.new.address).must_be_instance_of Gimei::Address
    end
  end

  describe '.prefecture' do
    it 'Gimei::Address::Prefecture オブジェクトが返ること' do
      _(Gimei.prefecture).must_be_instance_of Gimei::Address::Prefecture
    end
  end

  describe '#prefecture' do
    it 'Gimei::Address::Prefecture オブジェクトが返ること' do
      _(Gimei.new.prefecture).must_be_instance_of Gimei::Address::Prefecture
    end
  end

  describe '.city' do
    it 'Gimei::Address::City オブジェクトが返ること' do
      _(Gimei.city).must_be_instance_of Gimei::Address::City
    end
  end

  describe '#city' do
    it 'Gimei::Address::City オブジェクトが返ること' do
      _(Gimei.new.city).must_be_instance_of Gimei::Address::City
    end
  end

  describe '.town' do
    it 'Gimei::Address::Town オブジェクトが返ること' do
      _(Gimei.town).must_be_instance_of Gimei::Address::Town
    end
  end

  describe '#town' do
    it 'Gimei::Address::Town オブジェクトが返ること' do
      _(Gimei.new.town).must_be_instance_of Gimei::Address::Town
    end
  end
end
