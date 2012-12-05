# -*- coding:utf-8 -*
module FakerJapanese
  module Name
    extend self
    @first_names = [
      ["樹", 'イツキ'],
      ["大和", 'ヤマト'],
      ["太一", 'タイチ'],
      ["蒼空", 'アオゾラ'],
      ["翼", 'ツバサ'],
      ["陽菜", 'ハルナ'],
      ["結衣", 'ユイ'],
      ["杏", 'アンズ'],
      ["莉子", 'リコ'],
      ["美羽", 'ミウ'],
      ["結菜", 'ユイナ'],
      ["心愛", 'ココア'],
      ["愛菜", 'アイナ'],
      ["美咲", 'ミサキ']
    ]
    @last_names = [
      ["佐藤", 'サトウ'],
      ["鈴木", 'スズキ'],
      ["高橋", 'タカハシ'],
      ["田中", 'タナカ'],
      ["渡辺", 'ワタナベ'],
      ["伊藤", 'イトウ'],
      ["山本", 'ヤマモト'],
      ["中村", 'ナカムラ'],
      ["小林", 'コバヤシ'],
      ["加藤", 'カトウ'],
      ["吉田", 'ヨシダ'],
      ["山田", 'ヤマダ'],
      ["佐々木", 'ササキ'],
      ["山口", 'ヤマグチ'],
      ["斎藤", 'サイトウ'],
      ["松本", 'マツモト'],
      ["井上", 'イノウエ'],
      ["木村", 'キムラ'],
      ["林", 'ハヤシ'],
      ["清水", 'シミズ']
    ]

      def name
        first, last = first_name, last_name
        name = [last, first].join(' ')
        set_yomi(name, last.yomi + ' ' + first.yomi)
        name
      end

      [:first_name, :last_name].each do |m|
        define_method m do
          chosen = rand(instance_variable_get("@#{m}s"))
          name = chosen[0]
          set_yomi(name, chosen[1])
          name
        end
      end

      def set_yomi(name, yomi)
        name.instance_variable_set('@yomi', yomi)
        def name.yomi; @yomi end
      end

      def rand(array)
        array[Kernel.rand(array.size)]
      end
    end
end
