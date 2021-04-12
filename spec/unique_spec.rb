# coding: utf-8
require_relative 'spec_helper'

describe 'Gimei.unique' do
  before do
    Gimei.unique.clear
  end

  describe '#clear' do
    describe '名前が枯渇してからclearを実行し、再度名前を取得しようとしたとき' do
      it 'Gimei::RetryLimitExceededed例外が発生しないこと' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          Gimei.unique.male
          Gimei.unique.clear
          Gimei.unique.male
        end
      end
    end

    describe '名前が枯渇してからclear(:name)を実行し再度名前を取得しようとしたとき' do
      it 'Gimei::RetryLimitExceededed例外が発生しないこと' do
        Gimei.stub(:names, {
          'first_name' => {'male' => [%w[真一 しんいち シンイチ]]},
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          Gimei.unique.male
          Gimei.unique.clear(:name)
          Gimei.unique.male
        end
      end
    end

    describe '名前が枯渇してからclear(:address)を実行し再度名前を取得しようとしたとき' do
      it 'Gimei::RetryLimitExceededed例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => {'male' => [%w[真一 しんいち シンイチ]]},
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.male
            Gimei.unique.clear(:address)
            Gimei.unique.male
          end
        end
      end
    end
  end

  describe '#male' do
    describe '名前が枯渇していないとき' do
      it '一意な名前(フルネームの漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ], %w[神谷 かみや カミヤ]]
        }) do
          _([Gimei.unique.male.kanji, Gimei.unique.male.kanji].sort).must_equal ['前島 真一', '神谷 真一']
        end
      end
    end

    describe '名前が枯渇したとき' do
      it 'Gimei::RetryLimitExceededed例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.male
            Gimei.unique.male
          end
        end
      end
    end
  end

  describe '#female' do
    describe '名前が枯渇していないとき' do
      it '一意な名前(フルネームの漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'female' => [%w[花子 はなこ ハナコ]] },
          'last_name' => [%w[前島 まえしま マエシマ], %w[神谷 かみや カミヤ]]
        }) do
          _([Gimei.unique.female.kanji, Gimei.unique.female.kanji].sort).must_equal ['前島 花子', '神谷 花子']
        end
      end
    end

    describe '名前が枯渇したとき' do
      it 'Gimei::RetryLimitExceededed例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'female' => [%w[花子 はなこ ハナコ]] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.female
            Gimei.unique.female
          end
        end
      end
    end
  end

  describe '#first' do
    describe '名が枯渇していないとき' do
      it '一意な名(漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ], %w[真二 しんじ シンジ]] },
          'last_name' => %w[]
        }) do
          _([Gimei.unique.first(:male).kanji, Gimei.unique.first(:male).kanji].sort).must_equal %w[真一 真二]
        end
      end
    end

    describe '名が枯渇したとき' do
      it 'Gimei::RetryLimitExceeded例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => []
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.first(:male)
            Gimei.unique.first(:male)
          end
        end
      end
    end
  end

  describe '#last' do
    describe '姓が枯渇していないとき' do
      it '一意な姓(漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [], 'female' => [] },
          'last_name' => [%w[前島 まえしま マエシマ], %w[神谷 かみや カミヤ]]
        }) do
          _([Gimei.unique.last.kanji, Gimei.unique.last.kanji].sort).must_equal %w[前島 神谷]
        end
      end
    end

    describe '姓が枯渇したとき' do
      it 'Gimei::RetryLimitExceeded例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [], 'female' => [] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.last
            Gimei.unique.last
          end
        end
      end
    end
  end

  describe '#kanji' do
    describe '名前が枯渇していないとき' do
      it '一意な名前(フルネームの漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ], %w[神谷 かみや カミヤ]]
        }) do
          _([Gimei.unique.kanji(:male), Gimei.unique.kanji(:male)].sort).must_equal ['前島 真一', '神谷 真一']
        end
      end
    end

    describe '名前が枯渇したとき' do
      it 'Gimei::RetryLimitExceededed例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.kanji(:male)
            Gimei.unique.kanji(:male)
          end
        end
      end
    end
  end

  describe '#hiragana' do
    describe '名前が枯渇していないとき' do
      it '一意な名前(フルネームの漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ], %w[神谷 かみや カミヤ]]
        }) do
          _([Gimei.unique.hiragana(:male), Gimei.unique.hiragana(:male)].sort).must_equal ['かみや しんいち', 'まえしま しんいち']
        end
      end
    end

    describe '名前が枯渇したとき' do
      it 'Gimei::RetryLimitExceededed例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.hiragana(:male)
            Gimei.unique.hiragana(:male)
          end
        end
      end
    end
  end

  describe '#katakana' do
    describe '名前が枯渇していないとき' do
      it '一意な名前(フルネームの漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ], %w[神谷 かみや カミヤ]]
        }) do
          _([Gimei.unique.katakana(:male), Gimei.unique.katakana(:male)].sort).must_equal ['カミヤ シンイチ', 'マエシマ シンイチ']
        end
      end
    end

    describe '名前が枯渇したとき' do
      it 'Gimei::RetryLimitExceededed例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.katakana(:male)
            Gimei.unique.katakana(:male)
          end
        end
      end
    end
  end

  describe '#romaji' do
    describe '名前が枯渇していないとき' do
      it '一意な名前(フルネームの漢字単位)が返ること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ], %w[神谷 かみや カミヤ]]
        }) do
          _([Gimei.unique.romaji(:male), Gimei.unique.romaji(:male)].sort).must_equal ['Shinichi Kamiya', 'Shinichi Maeshima']
        end
      end
    end

    describe '名前が枯渇したとき' do
      it 'Gimei::RetryLimitExceededed例外が発生すること' do
        Gimei.stub(:names, {
          'first_name' => { 'male' => [%w[真一 しんいち シンイチ]] },
          'last_name' => [%w[前島 まえしま マエシマ]]
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.romaji(:male)
            Gimei.unique.romaji(:male)
          end
        end
      end
    end
  end

  describe '#address' do
    describe '住所が枯渇していないとき' do
      it '一意な住所(漢字単位)が返ること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [%w[東京都 とうきょうと トウキョウト]],
            'city' => [%w[渋谷区 しぶやく シブヤク]],
            'town' => [%w[恵比寿 えびす エビス], %w[蛭子 えびす エビス]]
          }
        }) do
          _([Gimei.unique.address.kanji, Gimei.unique.address.kanji].sort).must_equal %w[東京都渋谷区恵比寿 東京都渋谷区蛭子]
        end
      end
    end

    describe '住所が枯渇したとき' do
      it 'Gimei::RetryLimitExceeded例外が発生すること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [%w[東京都 とうきょうと トウキョウト]],
            'city' => [%w[渋谷区 しぶやく シブヤク]],
            'town' => [%w[恵比寿 えびす エビス]]
          }
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.address
            Gimei.unique.address
          end
        end
      end
    end
  end

  describe '#prefecture' do
    describe '県が枯渇していないとき' do
      it '一意な県が返ること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [%w[東京都 とうきょうと トウキョウト], %w[静岡県 しずおかけん シズオカケン]],
            'city' => [],
            'town' => []
          }
        }) do
          _([Gimei.unique.prefecture.kanji, Gimei.unique.prefecture.kanji].sort).must_equal %w[東京都 静岡県]
        end
      end
    end

    describe '県が枯渇したとき' do
      it 'Gimei::RetryLimitExceeded例外が発生すること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [%w[東京都 とうきょうと トウキョウト]],
            'city' => [],
            'town' => []
          }
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.prefecture
            Gimei.unique.prefecture
          end
        end
      end
    end
  end

  describe '#city' do
    describe '市区町村が枯渇していないとき' do
      it '一意な市区町村が返ること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [],
            'city' => [%w[渋谷区 しぶやく シブヤク], %w[新宿区 しんじゅくく シンジュクク]],
            'town' => []
          }
        }) do
          _([Gimei.unique.city.kanji, Gimei.unique.city.kanji].sort).must_equal %w[新宿区 渋谷区]
        end
      end
    end

    describe '市区町村が枯渇したとき' do
      it 'Gimei::RetryLimitExceeded例外が発生すること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [],
            'city' => [%w[渋谷区 しぶやく シブヤク]],
            'town' => []
          }
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.city
            Gimei.unique.city
          end
        end
      end
    end
  end

  describe '#town' do
    describe 'その他住所が枯渇していないとき' do
      it '一意なその他住所が返ること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [],
            'city' => [],
            'town' => [%w[恵比寿 えびす エビス], %w[蛭子 えびす エビス]]
          }
        }) do
          _([Gimei.unique.town.kanji, Gimei.unique.town.kanji].sort).must_equal %w[恵比寿 蛭子]
        end
      end
    end

    describe 'その他住所が枯渇したとき' do
      it 'Gimei::RetryLimitExceeded例外が発生すること' do
        Gimei.stub(:addresses, {
          'addresses' => {
            'prefecture' => [],
            'city' => [],
            'town' => [%w[恵比寿 えびす エビス]]
          }
        }) do
          assert_raises Gimei::RetryLimitExceeded do
            Gimei.unique.town
            Gimei.unique.town
          end
        end
      end
    end
  end
end
