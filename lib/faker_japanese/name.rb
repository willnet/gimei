# -*- coding:utf-8 -*
module FakerJapanese
  module Name
    @first_names = [
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
    @last_names = [
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

    class << self
      def name
        first, last = first_name, last_name
        name = [last, first].join(' ')
        set_yomi(name, "#{last.hiragana} #{first.hiragana}", "#{last.katakana} #{first.katakana}")
        name
      end

      def first_name
        set_yomi(*@first_names.sample)
      end

      def last_name
        set_yomi(*@last_names.sample)
      end

      def set_yomi(name, hiragana, katakana)
        name.define_singleton_method(:hiragana) { hiragana }
        name.define_singleton_method(:katakana) { katakana }
        name
      end

      def rand(array)
        array[Kernel.rand(array.size)]
      end
    end
  end
end
