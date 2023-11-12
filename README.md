# node-typescript-tool-boilerplate

## このリポジトリについて
Node.jsとTypeScriptを使ったちょっとしたCLIツールを開発するためのボイラープレートリポジトリです。

## 環境構築(Docker)
```
$ git clone https://github.com/imo-tikuwa/node-typescript-tool-boilerplate.git
$ cd node-typescript-tool-boilerplate/
$ make init
```

## 使い方
- ツールのソースはsrcフォルダ内に作成します。
- `make node`コマンドでコンテナの中に入ることができます。
    - 初期のディレクトリは`/app/src`です。
    - `/app`ディレクトリはホストとコンテナ間でDockerのボリューム共有を行っています。
- `make execute`コマンドでsrcフォルダ内のTypeScriptのコードをts-nodeから実行できます。
    - 上記コマンドを実行するとsrcフォルダ内のtsファイルを読み取り番号とファイル名のリストを表示します。
    - 番号を入力することで該当のプログラムの動作確認を行えます。
- `make build`コマンドでsrcフォルダ内のTypeScriptのコードをtscを用いてNode.jsで実行可能なプログラムにコンパイルします。
    - distフォルダ内にコンパイルされたjsファイルが出来上がります。
    - コンパイルされたjsファイルは`node [jsファイル名]`から実行できます。
        - `※外部のモジュールを使用しているプログラムでは適切なインポートが行えるよう、プログラムと同じディレクトリでnpmによる該当のパッケージインストールが必要`
- `make bundle`コマンドで[Parcel](https://parceljs.org/)というバンドラを用いて外部のパッケージを含めたバンドルを作成することができます。
    - bundleフォルダ内にバンドルされたjsファイルが出来上がります。
    - バンドルされたjsファイルは`node [jsファイル名]`から実行できます。