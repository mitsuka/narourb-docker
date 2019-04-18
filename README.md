# Narou.rb on Docker

Narou.rbの動作する環境をまるっとDocker上に用意しました。

Narou.rbの使い方など詳細については https://github.com/whiteleaf7/narou/wiki へどうぞ。

# 外からもってきたコマンドについて

それぞれのライセンスを守って正しくお使いください。
AozoraEpub3はGPLv3なので配布物を加工せずそのまま同梱しています。

## AozoraEpub3

https://github.com/hmdev/AozoraEpub3

## KindleGen

https://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211


# 使い方

docker imageのbuildはmakeでできます。

```
$ make build amazon_eula=yes
```

narou.rbをそのまま使うように使えるshell scriptを同梱しておきました。

```
$ ./narou help
```

デフォルトの設定は自分の好みにしてあるので、お好みで `./narou settings` してください。
enjoy!

