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
