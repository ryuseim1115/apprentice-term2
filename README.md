# TERM2 セットアップ手順（clone → MySQLログイン → DB/テーブル作成 → データ投入）

このリポジトリは、`sql/` 配下の SQL を `mysql` コマンドの `source` で実行して、
データベース作成・テーブル作成・初期データ投入を行います。

---

## 1. clone（リポジトリ取得）

```bash
# クローン
git clone https://github.com/ryuseim1115/apprentice-term2

# フォルダへ移動（TERM2 というディレクトリ名の場合）
cd TERM2

## 2. MySQL にログイン

```bash
# リポジトリ直下（TERM2/）にいることを確認
pwd
# 例）.../TERM2
```

## 2. MySQL にログイン
```bash
mysql -u ユーザー名 -p
```


## 3. データベース作成・テーブル作成・データ挿入（source 実行）
MySQL 画面で、以下を **上から順に** 実行してください。

```sql
source ./sql/ddl/create_database.sql;

use term2;

source ./sql/ddl/create_program.sql;
source ./sql/ddl/create_genre.sql;
source ./sql/ddl/create_channel.sql;
source ./sql/ddl/create_program_genre.sql;
source ./sql/ddl/create_season.sql;
source ./sql/ddl/create_episode.sql;
source ./sql/ddl/create_broadcast.sql;

source ./sql/dml/insert_program.sql;
source ./sql/dml/insert_genre.sql;
source ./sql/dml/insert_program_genre.sql;
source ./sql/dml/insert_season.sql;
source ./sql/dml/insert_episode.sql;
source ./sql/dml/insert_channel.sql;
source ./sql/dml/insert_broadcast.sql;
source ./sql/dml/insert_view_info.sql;
```

## 4.動作確認（任意）

```sql
show databases;

use term2;
show tables;

select count(*) from program;
select count(*) from genre;
select count(*) from program_genre;
select count(*) from season;
select count(*) from episode;
select count(*) from channel;
select count(*) from broadcast;
select count(*) from view_info;

```

## 5.ディレクトリ構成
```text
TERM2/
├─ .vscode/
├─ doc/
│  ├─ テーブル定義書/ #🚨課題ステップ1
│  └─ internet_tv_er.pu
├─ sql/
│  ├─ ddl/        # テーブル定義（CREATE TABLE）
│  ├─ dml/        # 初期データ投入（INSERT）
│  └─ query/      #🚨課題ステップ3
├─ .gitignore
└─ README.md #🚨課題ステップ2


```