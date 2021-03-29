# Gimei

[![Travis](https://img.shields.io/travis/willnet/gimei.svg)](https://travis-ci.org/willnet/gimei)
[![Coveralls](https://coveralls.io/repos/willnet/gimei/badge.svg)](https://coveralls.io/r/willnet/gimei)
[![Code Climate](https://codeclimate.com/github/willnet/gimei/badges/gpa.svg)](https://codeclimate.com/github/willnet/gimei)
[![Gem](https://img.shields.io/gem/v/gimei.svg)](https://rubygems.org/gems/gimei)

gimei は、日本人の名前や、日本の住所をランダムに返すライブラリです。テストの時などに使います。似たようなライブラリに[faker](https://github.com/stympy/faker)があります。[faker](https://github.com/stympy/faker)はとても優れたライブラリで、多言語対応もしていますが、ふりがな(フリガナ)は流石に対応していません。gimei はふりがな(及びフリガナ)に対応しています。


## 使い方

### 名前をランダムで返す

下記のように使います。

```ruby
gimei = Gimei.name
gimei.kanji          #=> "斎藤 陽菜"
gimei.hiragana       #=> "さいとう はるな"
gimei.katakana       #=> "サイトウ ハルナ"
gimei.romaji         #=> "Haruna Saitou"
gimei.gender         #=> :female
gimei.male?          #=> false
gimei.female?        #=> true
gimei.last.kanji     #=> "斎藤"
gimei.last.hiragana  #=> "さいとう"
gimei.last.katakana  #=> "サイトウ"
gimei.last.romaji    #=> "Saitou"
gimei.first.kanji    #=> "陽菜"
gimei.first.hiragana #=> "はるな"
gimei.first.katakana #=> "ハルナ"
gimei.first.romaji   #=> "Haruna"
```

下記のように男性／女性の名前を返すことを明示的に指定できます。`Gimei.name` の場合は男女の名前を等確率で返します。

```ruby
gimei = Gimei.male
gimei.male?   #=> true
gimei.female? #=> false
gimei.gender  #=> :male
gimei.kanji   #=> "小林 顕士"

gimei = Gimei.female
gimei.male?   #=> false
gimei.female? #=> true
gimei.gender  #=> :female
gimei.kanji   #=> "根本 彩世"
```

漢字、ひらがな、カタカナ、ローマ字どれか一種類だけ取得できればよい場合には、下記のように短縮して書くことも出来ます。

```ruby
Gimei.kanji          #=> "伊藤 結衣"
Gimei.hiragana       #=> "いとう みさき"
Gimei.katakana       #=> "タカハシ ユイナ"
Gimei.romaji         #=> "Miki Obara"
Gimei.last.kanji     #=> "清水"
Gimei.last.hiragana  #=> "いとう"
Gimei.last.katakana  #=> "コバヤシ"
Gimei.last.romaji    #=> "Wakabayashi"
Gimei.first.kanji    #=> "結菜"
Gimei.first.hiragana #=> "ここあ"
Gimei.first.katakana #=> "ヤマト"
Gimei.first.romaji   #=> "Noriyuki"
```

同じ名前を二度取得したくない場合には、以下のように`unique`を挟みます。次のようにすると、利用した名前をGimei内で保持することで必ず一意な名前を返すようにできます。

```ruby
Gimei.unique.name
```

上記の場合は、フルネームの漢字が一意であることを保証します。つまり、次のように姓や名の単位では重複することもありえます。

```ruby
Gimei.unique.name.kanji #=> "前島 真一"
Gimei.unique.name.kanji #=> "神谷 真一"
Gimei.unique.name.kanji #=> "前島 太郎"
```

これを避けたいときは次のように`last`や`first`を利用してください。これは姓や名の単位で一意な名前を返します。

```ruby
Gimei.unique.last
Gimei.unique.first
```

この場合でも、ふりがな(フリガナ)の単位では重複することがあります。

```ruby
Gimei.unique.first.hiragana #=> "しんいち"
Gimei.unique.first.hiragana #=> "しんいち"
```

もし名前の候補が枯渇するなど、一意な名前を返せない場合はエラーになります。

これまで利用した名前のリストを消去したい場合は、次のようにします。

```ruby
Gimei.unique.clear # 全体を消去
Gimei.unique.clear(:name) # Gimei.unique.name の結果を消去
Gimei.unique.clear(:first) # Gimei.unique.first の結果を消去
```

次のメソッドで生成された名前は`Gimei.unique.clear(:name)`で消去します。

- `Gimei.unique.male`
- `Gimei.unique.female`
- `Gimei.unique.kanji`

出力される名前の候補となるデータは `lib/data/names.yml` にあるので、必要であればファイルを修正してください。

### 住所をランダムで返す

バージョン0.2.0からは、住所情報も取得できるようになりました。都道府県、区、市、町を組み合わせた住所情報を漢字、ひらがな、カタカナで取得することができます。

```ruby
address = Gimei.address
address.kanji                 # => 岡山県大島郡大和村稲木町
address.to_s                  # => 岡山県大島郡大和村稲木町
address.hiragana              # => おかやまけんおおしまぐんやまとそんいなぎちょう
address.katakana              # => オカヤマケンオオシマグンヤマトソンイナギチョウ
address.romaji                # => Okayamaken Ooshimagunyamatoson Inagicho

address.prefecture.kanji      # => 岡山県
address.prefecture.to_s       # => 岡山県
address.prefecture.hiragana   # => おかやまけん
address.prefecture.katakana   # => オカヤマケン
address.prefecture.romaji     # => Okayamaken

address.city.kanji            # => 大島郡大和村
address.city.to_s             # => 大島郡大和村
address.city.hiragana         # => おおしまぐんやまとそん
address.city.katakana         # => オオシマグンヤマトソン
address.city.romaji           # => Ooshimagunyamatoson

address.town.kanji            # => 稲木町
address.town.to_s             # => 稲木町
address.town.hiragana         # => いなぎちょう
address.town.katakana         # => イナギチョウ
address.town.romaji           # => Inagicho
```

省略形も用意しています。

```ruby
Gimei.prefecture.kanji        # => 青森県
Gimei.prefecture.to_s         # => 滋賀県
Gimei.prefecture.hiragana     # => やまがたけん
Gimei.prefecture.katakana     # => チバケン
Gimei.prefecture.romaji       # => Wakayamaken

Gimei.city.kanji              # => 利根郡昭和村
Gimei.city.hiragana           # => うべし
Gimei.city.katakana           # => カモグンヤオツチョウ
Gimei.city.romaji             # => Itanogunaizumichou

Gimei.town.kanji              # => 竹野
Gimei.town.to_s               # => 富久山町南小泉
Gimei.town.hiragana           # => じょうしんでん
Gimei.town.katakana           # => イケナイ
Gimei.town.romaji             # => Heisei
```

同じ住所を二度取得したくない場合には、以下のように`unique`を挟みます。次のようにすると、利用した住所をGimei内で保持することで必ず一意な名前を返すようにできます。

```ruby
address = Gimei.unique.address
```

上記の場合は、住所全体が一意であることを保証します。つまり、次のように県や市町村の単位では重複することもありえます。

```ruby
Gimei.unique.address.prefecture.kanji #=> 東京都
Gimei.unique.address.prefecture.kanji #=> 東京都
```

もし県や市町村の単位で一意であることを保証したいのであれば、次のように短縮形を使います。

```ruby
Gimei.unique.prefecture.kanji #=> 東京都
Gimei.unique.prefecture.kanji #=> 神奈川県
```

もし住所の候補が枯渇するなど、一意な名前を返せない場合はエラーになります。

これまで利用した住所のリストを消去したい場合は、次のようにします。

```ruby
Gimei.unique.clear # 全体を消去
Gimei.unique.clear(:address) # Gimei.unique.address の結果を消去
Gimei.unique.clear(:prefecture) # Gimei.unique.prefecture の結果を消去
```

出力される住所の候補となるデータは `lib/data/addresses.yml` にあるので、必要であればファイルを修正してください。

## Supported versions

- 2.2.x
- 2.3.x
- 2.4.x
- 2.5.x
- 2.6.x
- 2.7.x
- 3.0.x

## 他言語による実装

- [mattn/go-gimei](https://github.com/mattn/go-gimei)
- [moznion/gimei-java](https://github.com/moznion/gimei-java)
- [nabetama/gimei](https://github.com/nabetama/gimei)
- [gongo/emacs-gimei](https://github.com/gongo/emacs-gimei)
- [ma2gedev/gimei_ex](https://github.com/ma2gedev/gimei_ex)
- [demiglacesource/node-gimei](https://github.com/demiglacesource/node-gimei)
- [matarillo/dot-gimei](https://github.com/matarillo/dot-gimei)
- [abcb2/type-gimei](https://github.com/abcb2/type-gimei)

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
