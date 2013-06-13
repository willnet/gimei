# -*- coding:utf-8 -*
module FakerJapanese
  class Name
    class First
      NAMES = [
        ['樹', 'いつき', 'イツキ'],
        ['大和', 'やまと', 'ヤマト'],
        ['太一', 'たいち', 'タイチ'],
        ['蒼空', 'あおぞら', 'アオゾラ'],
        ['翼', 'つばさ', 'ツバサ'],
        ['陽菜', 'はるな', 'ハルナ'],
        ['結衣', 'ゆい', 'ユイ'],
        ['杏', 'あんず', 'アンズ'],
        ['莉子', 'りこ', 'リコ'],
        ['美羽', 'みう', 'ミウ'],
        ['結菜', 'ゆいな', 'ユイナ'],
        ['心愛', 'ここあ', 'ココア'],
        ['愛菜', 'あいな', 'アイナ'],
        ['美咲', 'みさき', 'ミサキ']
      ]

      def initialize
        @name = NAMES.sample
      end

      def kanji
        @name[0]
      end

      def hiragana
        @name[1]
      end

      def katakana
        @name[2]
      end
    end

    class Last
      NAMES = [
        ['佐藤', 'さとう', 'サトウ'],
        ['鈴木', 'すずき', 'スズキ'],
        ['高橋', 'たかはし', 'タカハシ'],
        ['田中', 'たなか', 'タナカ'],
        ['渡辺', 'わたなべ', 'ワタナベ'],
        ['伊藤', 'いとう', 'イトウ'],
        ['山本', 'やまもと', 'ヤマモト'],
        ['中村', 'なかむら', 'ナカムラ'],
        ['小林', 'こばやし', 'コバヤシ'],
        ['加藤', 'かとう', 'カトウ'],
        ['吉田', 'よしだ', 'ヨシダ'],
        ['山田', 'やまだ', 'ヤマダ'],
        ['佐々木', 'ささき', 'ササキ'],
        ['山口', 'やまぐち', 'ヤマグチ'],
        ['斎藤', 'さいとう', 'サイトウ'],
        ['松本', 'まつもと', 'マツモト'],
        ['井上', 'いのうえ', 'イノウエ'],
        ['木村', 'きむら', 'キムラ'],
        ['林', 'はやし', 'ハヤシ'],
        ['清水', 'しみず', 'シミズ']
      ]
      def initialize
        @name = NAMES.sample
      end

      def kanji
        @name[0]
      end

      def hiragana
        @name[1]
      end

      def katakana
        @name[2]
      end
    end

    def initialize
      @first = First.new
      @last = Last.new
    end

    def kanji
      "#{last.kanji} #{first.kanji}"
    end

    def hiragana
      "#{last.hiragana} #{first.hiragana}"
    end

    def katakana
      "#{last.katakana} #{first.katakana}"
    end

    def first
      @first
    end

    def last
      @last
    end

    class << self
      def kanji
        name = new
        "#{name.last.kanji} #{name.first.kanji}"
      end

      def hiragana
        name = new
        "#{name.last.hiragana} #{name.first.hiragana}"
      end

      def katakana
        name = new
        "#{name.last.katakana} #{name.first.katakana}"
      end

      def first
        new.first
      end

      def last
        new.last
      end
    end
  end
end
