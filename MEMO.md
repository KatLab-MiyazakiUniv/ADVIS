
# このプロジェクトの利用案内
Travis CIを導入している．

このプロジェクトは，設定をきちんとしないとRunできないと思います．

Homebrewを使用します．

Carthageのインストール

`brew install carthage`

LicensePlistのインストール（これがないとRun時にエラー出るかも．）

`brew install mono0926/license-plist/license-plist`

このリポジトリ（ADVIS/master）のダウンロード

`git clone https://github.com/Tatsumi0000/ADVIS.git`

プロジェクトへ移動

`cd ADVIS/ADVIS`

必要ライブラリをインストール（ちょっと時間かかるかも．）

`carthage update --platform iOS`

プロジェクトを開く

`open ./ADVIS.xcodeproj`

デバイスをiPad Pro 12.9にしてから（iPadなら何でもよくする予定．現時点では，iPadPro12.9 nchのみ対応）Run．

<kbd><kbd>command</kbd>+<kbd>R</kbd></kbd>

- Run時にターミナルが立ち上がるかもしれません．これは，プロジェクト内にあるライブラリのライセンスを自動生成してます（iPad内の設定からADVISを選択すると見れます．）．
- このプロジェクトでは，**SwiftyBeaver**というライブラリを使ってデバッグしています．このライブラリを使うためには，**SwiftyBeaver**というアプリをMacにインストールして`AppDelegate.swift`で設定してください．
- **上に書いた方法でRunできるはずです**
- このプロジェクトは，[SwiftFormat](https://github.com/nicklockwood/SwiftFormat)を使って`git commit`時にソースコードを自動整形するように設定してあります．

# 画像

- [Arduino Uno](https://pixabay.com/ja/arduino-arduino%E3%81%AEuno-%E6%8A%80%E8%A1%93-%E3%83%87%E3%82%B8%E3%82%BF%E3%83%AB-2168193/) - Arduino Uno の画像

- ブレッドボード - 昔のアプリの中にあったものを流用

# 使用ライブラリ
 - SwiftyBeaver - デバッグ時に`print("A")`とかしてコンソールに出すのを，コンソールに出力しつつ専用アプリにログを出すライブラリ．コレ入れると普通に動かしていても自動でログが専用アプリに飛んでくる．
 
 - 他は，あとで書く予定
 
 # フォルダ構成
 
 - 後ほど追記
 
 # Classの中身
 
 - 後ほど追記
 
 # このプロジェクトのドキュメント
 
- Travis CIでテストに通ると**jazzy**がドキュメントを生成．（設定ファイルは，.jazzy.yamlに記述）
- その後，自動で`gh-pages`ブランチにデプロイする．
- ドキュメントのURLは[こちら](https://tatsumi0000.github.io/ADVIS/)
 
 # このプロジェクトのテストコードとか
 
 - 現在は，**XCTest**を使ってテストコードを書いている．
 
 - しかしテストコードは， [ArduinoUnoPointControl12_9.swift](https://github.com/Tatsumi0000/ADVIS/blob/master/ADVIS/ADVIS/ArduinoUnoPointControl12_9.swift)の一部しか書いていない．そのテストコードは [こちら](https://github.com/Tatsumi0000/ADVIS/blob/master/ADVIS/ADVISTests/ArduinoUnoPointControl12_9Tests.swift)


