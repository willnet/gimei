# coding: utf-8
require_relative 'spec_helper'

describe Gimei do
  describe '.male' do
    before { @name = Gimei.male }

    it 'Gimei::Name オブジェクトが返ること' do
      @name.must_be_instance_of Gimei::Name
    end

    it '#male? が true を返すこと' do
      @name.male?.must_equal true
    end
  end

  describe '.female' do
    before { @name = Gimei.female }

    it 'Gimei::Name オブジェクトが返ること' do
      @name.must_be_instance_of Gimei::Name
    end

    it '#female? が true を返すこと' do
      @name.female?.must_equal true
    end
  end

  describe '#kanji' do
    it '全角文字とスペースが返ること' do
      Gimei.new.kanji.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '#to_s' do
    it '全角文字とスペースが返ること' do
      Gimei.new.to_s.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '.kanji' do
    it '全角文字とスペースが返ること' do
      Gimei.kanji.must_match /\A[#{Moji.zen}\s]+\z/
    end
  end

  describe '#hiragana' do
    it 'ひらがなとスペースが返ること' do
      Gimei.new.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '.hiragana' do
    it 'ひらがなとスペースが返ること' do
      Gimei.hiragana.must_match /\A[\p{hiragana}\s]+\z/
    end
  end

  describe '#katakana' do
    it 'カタカナとスペースが返ること' do
      Gimei.new.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end

  describe '.katakana' do
    it 'カタカナとスペースが返ること' do
      Gimei.katakana.must_match /\A[\p{katakana}\s]+\z/
    end
  end

  describe '.name' do
    it 'Gimei::Name オブジェクトが返ること' do
      Gimei.name.must_be_instance_of Gimei::Name
    end
  end

  describe '#name' do
    it 'Gimei::Name オブジェクトが返ること' do
      Gimei.new.name.must_be_instance_of Gimei::Name
    end
  end

  describe '.first' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      Gimei.first.must_be_instance_of Gimei::Name::First
    end
  end

  describe '#first' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      Gimei.new.first.must_be_instance_of Gimei::Name::First
    end
  end

  describe '.last' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      Gimei.last.must_be_instance_of Gimei::Name::Last
    end
  end

  describe '#last' do
    it 'Gimei::Name::First オブジェクトが返ること' do
      Gimei.new.last.must_be_instance_of Gimei::Name::Last
    end
  end

  describe '.romaji' do
    it 'ローマ字とスペースが返ること' do
      Gimei.romaji.must_match(/\A[a-zA-Z\s]+\z/)
    end
  end

  describe '#romaji' do
    it 'ローマ字とスペースが返ること' do
      Gimei.new.romaji.must_match(/\A[a-zA-Z\s]+\z/)
    end
  end

  describe '.address' do
    it 'Gimei::Address オブジェクトが返ること' do
      Gimei.address.must_be_instance_of Gimei::Address
    end
  end

  describe '#address' do
    it 'Gimei::Address オブジェクトが返ること' do
      Gimei.new.address.must_be_instance_of Gimei::Address
    end
  end

  describe '.prefecture' do
    it 'Gimei::Address::Prefecture オブジェクトが返ること' do
      Gimei.prefecture.must_be_instance_of Gimei::Address::Prefecture
    end
  end

  describe '#prefecture' do
    it 'Gimei::Address::Prefecture オブジェクトが返ること' do
      Gimei.new.prefecture.must_be_instance_of Gimei::Address::Prefecture
    end
  end

  describe '.city' do
    it 'Gimei::Address::City オブジェクトが返ること' do
      Gimei.city.must_be_instance_of Gimei::Address::City
    end
  end

  describe '#city' do
    it 'Gimei::Address::City オブジェクトが返ること' do
      Gimei.new.city.must_be_instance_of Gimei::Address::City
    end
  end

  describe '.town' do
    it 'Gimei::Address::Town オブジェクトが返ること' do
      Gimei.town.must_be_instance_of Gimei::Address::Town
    end
  end

  describe '#town' do
    it 'Gimei::Address::Town オブジェクトが返ること' do
      Gimei.new.town.must_be_instance_of Gimei::Address::Town
    end
  end

  describe '.unique#address' do
    it 'ユニークなアドレスが返ること' do
      Gimei.unique.set_max_retries(10000)
      unique_addresses = Array.new(10000) do
        Gimei.unique.address.to_s
      end
      assert_equal(unique_addresses.uniq, unique_addresses)
    end

    it '例外が発生すること' do
      Gimei.unique.set_max_retries(1)
      expect{
        loop do
          Gimei.unique.address
        end
      }.must_raise UniqueGenerator::RetryLimitExceeded
    end
  end

  describe '.unique#name' do
    it 'ユニークな名前が返ること' do
      Gimei.unique.set_max_retries(10000)
      unique_names = Array.new(10000) do
        Gimei.unique.name.to_s
      end

      assert_equal(unique_names.uniq, unique_names)
    end

    it '例外が発生すること' do
      Gimei.unique.set_max_retries(1)
      expect{
        loop do
          Gimei.unique.name
        end
      }.must_raise UniqueGenerator::RetryLimitExceeded
    end
  end

  describe '.unique#clear' do
    it '過去の検索結果が消えていること' do
      Gimei.unique.name
      Gimei.unique.clear
      expect(Gimei.unique.instance_variable_get(:@previous_results)).must_be_empty
    end
  end

  describe '.unique.clear' do
    it '過去の検索結果が消えていること' do
      Gimei.unique.name
      Gimei.unique.address
      UniqueGenerator.clear
      expect(Gimei.unique.instance_variable_get(:@previous_results)).must_be_empty
    end
  end

  describe '.unique#exclude' do
    it '除外した値が取得されないこと' do
      Gimei.unique.set_max_retries(10000)
      Gimei.unique.exclude(:address, [], ["大分県釧路郡釧路町平野"])
      unique_addresses = Array.new(10000) do
        Gimei.unique.address.to_s
      end
      expect(unique_addresses).wont_include "大分県釧路郡釧路町平野"
    end
  end

end
