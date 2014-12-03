# Gimei

[![Build Status](https://travis-ci.org/willnet/gimei.png)](https://travis-ci.org/willnet/gimei)
[![Coverage Status](https://coveralls.io/repos/willnet/gimei/badge.png)](https://coveralls.io/r/willnet/gimei)
[![Gem Version](https://badge.fury.io/rb/gimei.png)](http://badge.fury.io/rb/gimei)
[![endorse](https://api.coderwall.com/willnet/endorsecount.png)](https://coderwall.com/willnet)

gimei は、日本人の名前をランダムに返すライブラリです。テストの時などに使います。似たようなライブラリに[faker](https://github.com/stympy/faker)があります。[faker](https://github.com/stympy/faker)はとても優れたライブラリで、多言語対応もしていますが、ふりがな(フリガナ)は流石に対応していません。gimei は名前のふりがな(及びフリガナ)に対応しています。


## Usage

下記のように使います。

```ruby
gimei = Gimei.new
gimei.kanji #=> "斎藤 陽菜"
gimei.hiragana #=> "さいとう はるな"
gimei.katakana #=> "サイトウ ハルナ"
gimei.last.kanji #=> "斎藤"
gimei.last.hiragana #=> "さいとう"
gimei.last.katakana #=> "サイトウ"
gimei.first.kanji #=> "陽菜"
gimei.first.hiragana #=> "はるな"
gimei.first.katakana #=> "ハルナ"
```

下記のように男性／女性の名前を返すことを明示的に指定できます。`Gimei.new` の場合は男女の名前を等確率で返します。

```ruby
gimei = Gimei.male
gimei.male? #=> true
gimei.female? #=> false
gimei.kanji #=> "小林 顕士"

gimei = Gimei.female
gimei.male? #=> false
gimei.female? #=> true
gimei.kanji #=> "根本 彩世"
```

漢字、ひらがな、カタカナどれか一種類だけ取得できればよい場合には、下記のように短縮して書くことも出来ます。

```ruby
Gimei.kanji #=> "伊藤 結衣"
Gimei.hiragana #=> "いとう みさき"
Gimei.katakana #=> "タカハシ ユイナ"
Gimei.last.kanji #=> "清水"
Gimei.last.hiragana #=> "いとう"
Gimei.last.katakana #=> "コバヤシ"
Gimei.first.kanji #=> "結菜"
Gimei.first.hiragana #=> "ここあ"
Gimei.first.katakana #=> "ヤマト"
```

出力される名前の候補となるデータは `lib/data/names.yml` にあるので、必要であればファイルを修正してください。

バージョン0.2.0からは、住所情報も取得できるようになりました。都道府県、区、市、町を組み合わせた住所情報を漢字、ひらがな、カタカナで取得することができます。

```ruby
Gimei.kanji_prefectural      # => 島根県
Gimei.kanji_city             # => 糟屋郡宇美町
Gimei.kanji_town             # => 柚木
Gimei.kanji_address          # => 広島県 明石市 金屋谷
Gimei.hiragana_prefectural   # => ふくしまけん
Gimei.hiragana_city          # => いなしきぐんかわちまち
Gimei.hiragana_town          # => いわさきにし
Gimei.hiragana_address       # => きょうとふ さかいしにしく みさと
Gimei.katakana_prefectural   # => クマモトケン
Gimei.katakana_city          # => フナバシシ
Gimei.katakana_town          # => ショウフクジ
Gimei.katakana_address       # => ナガサキケン オオヌマグンショウワムラ ショウリン
```

## Installation

Add this line to your application's Gemfile:

    gem 'gimei'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gimei

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
