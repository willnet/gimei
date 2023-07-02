https://github.com/willnet/gimei/releases に移行しました

## 1.1.0

- Gimei::Name#family, #given を追加 [@nard-tech](https://github.com/nard-tech) (https://github.com/willnet/gimei/pull/50)
- テストケースの修正 [@nard-tech](https://github.com/nard-tech) https://github.com/willnet/gimei/pull/49

## 1.0.1

- Ruby 3.1のサポート[@willnet](https://github.com/willnet) (https://github.com/willnet/gimei/pull/48)
- 他言語による実装リストの更新 [@youpong](https://github.com/youpong) (https://github.com/willnet/gimei/pull/47)
- READMEに「再現可能なランダムデータ」の節を追加 [@youpong](https://github.com/youpong) (https://github.com/willnet/gimei/pull/45)

## 1.0.0

* データの読み込みを遅延させた [@willnet](https://github.com/willnet) (https://github.com/willnet/gimei/pull/41)
* Ruby2.2以下のサポートを削除 [@willnet](https://github.com/willnet)
  * [Drop ruby suport < 2.2.0 · willnet/gimei@d02363f](https://github.com/willnet/gimei/commit/d02363f2fc6ffa31a531576cb9f599a01e25194f)
  * 現時点ではテストしていないだけなので、未サポートのRubyでも動作はすると思いますが保証外です

## 0.5.1

* 住所データの更新 [kossy0701 (kawagoekeisuke)](https://github.com/kossy0701) (https://github.com/willnet/gimei/pull/38)

## 0.5.0

* Gimei.uniqueメソッドの追加 [@willnet](https://github.com/willnet) (https://github.com/willnet/gimei/pull/35)
* 乱数生成器を Config 経由で設定できるようにした [@purintai](https://github.com/purintai) ( https://github.com/willnet/gimei/pull/34  )

## 0.4.0

* Gimei#genderメソッドの追加 - [@nard-tech](https://github.com/nard-tech)
* Ruby 1.9のサポートを停止
* Ruby 2.7のサポートを開始

## 0.3.0

* ローマ字対応 - [@takkanm](https://github.com/takkanm)

## 0.2.0

* 住所対応 - [@miyohide](https://github.com/miyohide)

## 0.1.0

* サンプルデータの拡充 - [@2celeb](https://github.com/2celeb)
* `Gimei.male`, `Gimei.female` 等の男女指定用のメソッドを追加 - [@2celeb](https://github.com/2celeb)

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

## 0.0.1

initial version.
