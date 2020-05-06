PHP 5.6 and Apache 2.4 Docker Container
====

# Description　(説明)
PHP 5.6 & Apache 2.4 の Docker コンテナです。  
Apline Linux から構築しているのでイメージサイズを100M以下に抑えることが出来ます。

# ファイルの説明

- Dockerfile.dev  
開発/Staging用
- Dockerfile.prod  
本番用

# ビルド方法

## 開発/Staging用

```sh
./docker.sh -b dev
```

## 本番用

```sh
./docker.sh -b prod
```

# プッシュ方法
Dockerレジストリにプッシュします。  
プッシュ先は docker.sh を編集してください。

## 開発/Staging用

```sh
./docker.sh -p dev
```

## 本番用

```sh
./docker.sh -p prod
```
