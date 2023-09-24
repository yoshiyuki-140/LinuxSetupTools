# LinuxSetupTools
自分用の自動構成スクリプトなどなど

# 注意
- このままsetup.shを実行してから.vimrcなどを読み込むと"^M"を含んだエラーがおこる,これは改行文字が筆者のエディタとunixでは違うためおこる.

- 対処法  
    - $ vim .vimrcでファイルを開いてから以下のコマンドを実行
    ```vim script
    :setl ff=unix
    ```