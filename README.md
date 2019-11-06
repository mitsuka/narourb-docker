[![CircleCI](https://circleci.com/gh/mitsuka/narourb-docker/tree/master.svg?style=svg)](https://circleci.com/gh/mitsuka/narourb-docker/tree/master)

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

## DockerHub向け使い方

https://hub.docker.com/r/amitsuka/narourb-docker で公開しています。

* /opt/mybooksにWEB小説をダウンロードするように設定してあります
* /opt/outputに変換済みデータを出力するように設定してあります
* お好みのディレクトリをvolume mountして実行してください

実行例
```
docker pull amitsuka/narourb-docker
OUTPUT_DIR=${HOME}/.narou/output
MYBOOKS_DIR=${HOME}/.narou/mybooks
docker run -v ${MYBOOKS_DIR}:/opt/mybooks -v ${OUTPUT_DIR}:/opt/output -it amitsuka/narourb-docker narou help
```

シェルスクリプトにしておくと楽です。githubで公開しているsourceのほうに入れてあるので参考にしてみてください。

enjoy!

