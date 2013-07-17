## 0.1.0

* サンプルデータの拡充
* `Gimei.male`, `Gimei.female` 等の男女指定用のメソッドを追加

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
