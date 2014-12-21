# Gimei

[![Build Status](https://travis-ci.org/willnet/gimei.png)](https://travis-ci.org/willnet/gimei)
[![Coverage Status](https://coveralls.io/repos/willnet/gimei/badge.png)](https://coveralls.io/r/willnet/gimei)
[![Gem Version](https://badge.fury.io/rb/gimei.png)](http://badge.fury.io/rb/gimei)
[![endorse](https://api.coderwall.com/willnet/endorsecount.png)](https://coderwall.com/willnet)

gimei は、日本人の名前や、日本の住所をランダムに返すライブラリです。テストの時などに使います。似たようなライブラリに[faker](https://github.com/stympy/faker)があります。[faker](https://github.com/stympy/faker)はとても優れたライブラリで、多言語対応もしていますが、ふりがな(フリガナ)は流石に対応していません。gimei ふりがな(及びフリガナ)に対応しています。


## 使い方

### 名前をランダムで返す

下記のように使います。

```ruby
gimei = Gimei.name
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

下記のように男性／女性の名前を返すことを明示的に指定できます。`Gimei.name` の場合は男女の名前を等確率で返します。

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

### 住所をランダムで返す

バージョン0.2.0からは、住所情報も取得できるようになりました。都道府県、区、市、町を組み合わせた住所情報を漢字、ひらがな、カタカナで取得することができます。

```ruby
address = Gimei.address
address.kanji                 # => 岡山県大島郡大和村稲木町
address.to_s                  # => 岡山県大島郡大和村稲木町
address.hiragana              # => おかやまけんおおしまぐんやまとそんいなぎちょう
address.katakana              # => オカヤマケンオオシマグンヤマトソンイナギチョウ

address.prefecture.kanji      # => 岡山県
address.prefecture.to_s       # => 岡山県
address.prefecture.hiragana   # => おかやまけん
address.prefecture.katakana   # => オカヤマケン

address.city.kanji            # => 大島郡大和村
address.city.to_s             # => 大島郡大和村
address.city.hiragana         # => おおしまぐんやまとそん
address.city.katakana         # => オオシマグンヤマトソン

address.town.kanji            # => 稲木町
address.town.to_s             # => 稲木町
address.town.hiragana         # => いなぎちょう
address.town.katakana         # => イナギチョウ
```

省略形も用意しています。

```ruby
Gimei.prefecture.kanji        # => 青森県
Gimei.prefecture.to_s         # => 滋賀県
Gimei.prefecture.hiragana     # => やまがたけん
Gimei.prefecture.katakana     # => チバケン

Gimei.city.kanji              # => 利根郡昭和村
Gimei.city.hiragana           # => うべし
Gimei.city.katakana           # => カモグンヤオツチョウ

Gimei.town.kanji              # => 竹野
Gimei.town.to_s               # => 富久山町南小泉
Gimei.town.hiragana           # => じょうしんでん
Gimei.town.katakana           # => イケナイ
```

出力される住所の候補となるデータは `lib/data/addresses.yml` にあるので、必要であればファイルを修正してください。

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
