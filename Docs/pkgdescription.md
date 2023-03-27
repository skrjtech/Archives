# Linux パッケージ 説明　解説

|パッケージ名|説明|コマンド|オプション|使い方|
|---:|:---|:---|:---|:---|
|apt|システムのパッケージ管理|list: 管理パッケージの表示<br>search: パッケージ検索<br>show: パッケージ表示<br>install: パッケージインストール<br>reinstall: パッケージ再インストール<br>remove: パッケージ削除<br>autoremove: 依存パッケージを含めて削除<br>update: パッケージ更新<br>upgrade: システム更新<br>full-upgrade: システム更新＆不必要なパッケージの削除<br>edit-sources: 編集ファイル情報<br>satisfy: 不明|-y|sudo apt list<br>sudo apt search<br>sudo apt show<br>sudo apt install<br>sudo apt reinstall<br>sudo apt remove<br>sudo apt autoremove<br>sudo apt update<br>sudo apt upgrade<br>sudo apt full-upgrade<br>sudo apt edit-sources<br>sudo apt satisfy<br>|---
|git|ソース管理システム|init<br>add<br>commit<br>push<br>pull<br>remote<br>branch<br>checkout<br>fetch<br>merge<br>status<br>diff<br>log<br>show<br>reset<br>revert<br>rebase<br>stash<br>rm||apt init<br>git add \< file name \><br>git commit -m "commit description"<br>git push<br>git pull<br>|---
|vim|編集エディタ|
|nano|編集エディタ|
|gdb|デバッガ：クラッシュやプログラム実行中の内部を調べる為のツール|
|make|プログラム群を管理するための GNU make ユーティリティ|
|wget|GNU Wget ウェブサーバからコンテンツを取得するダウンローダ
|curl|cURLは、さまざまなプロトコルを用いてデータを転送するライブラリとコマンドラインツールを提供するプロジェクト
|htop|タスクマネージャ
|tmux|ターミナルマルチプレクサ 
|bzip2|データ圧縮プログラム
|cmake|コンパイラに依存しないビルド自動化のためのフリーソフトウェア
|xterm|X Window Systemの標準的な端末エミュレータである
|gnupg|暗号化ソフト
|gnupg2|公開鍵と秘密鍵のペアでメールの暗号化・復号化を行ったり署名を添付したりするツール
|libsm6|アプリケーションがセッションを管理したり、セッションマネージャ を利用して後で使用するために状態を保存・復元する
|procps|procpsは、ps, vmstat, top, w, skill, snice, pgrep, pkill, free, sysctl, pmap, uptime,killを含むユーティリティのパッケージ
|libxi6|libXi は、X Window System クライアントに X プロトコルの XINPUT 拡張へのイン ターフェース
|locales|現在のロケールと使用可能なロケールの情報を表示するコマンド
|gettext|国際化と地域化に対応するライブラリ構成要素の一つ
|texinfo|フリーなコンピュータ・プログラム であり、一式のソースコードから複数の形式で文書を生成する
|valgrind|メモリデバッグや、メモリリークの検出、スレッドエラーの検出、プロファイリングなどを行うための仮想機械を利用したソフトウェア開発ツール
|dbus-x11|ディレクトリのコピーの進捗状況を確認
|libxext6|X11 拡張系ライブラリ (その他の情報不明)
|mercurial|クロスプラットフォームのバージョン管理システムソフトウェア
|python-pip|python2系 pip
|python3-tk|python3 Tkinter ツール
|mesa-utils|
|subversion|
|terminator|
|libssl-dev|
|gnutls-bin|
|libbz2-dev|圧縮アルゴリズムのライブラリ
|zlib1g-dev|圧縮アルゴリズムのライブラリ
|libxfixes3|X Window System クライアントに X プロトコルの 'XFIXES' 拡張へ のインターフェース
|libxrandr2|
|subversion|
|python3-pip|python3系 pip
|default-jre|
|default-jdk|
|lsb-release|
|libxcursor1|
|libxdamage1|
|libxrender1| 
|libldap2-dev|
|libglib2.0-0|
|libxinerama1| 
|openssh-client| 
|libxcomposite1|
|libsqlite3-dev|
|build-essential|
|libgl1-mesa-glx|
|libgl1-mesa-dri|
|libgnutls28-dev|
|ca-certificates|
|libncurses5-dev|
|software-properties-common|