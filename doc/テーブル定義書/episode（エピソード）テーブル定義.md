## episode（エピソード）テーブル定義

| # | 論理名         | 物理名               | 型           | PK | NOT NULL | FK                | 備考           |
|---:|----------------|----------------------|--------------|:--:|:--------:|-------------------|----------------|
| 1 | エピソードID   | episode_id           | int          | ○  | ○        |                   | auto_increment |
| 2 | シーズンID     | season_id            | int          |    | ○        | season.season_id  |                |
| 3 | エピソード番号 | episode_no           | int          |    | ○        |                   |                |
| 4 | エピソードタイトル | episode_title     | VARCHAR(100) |    | ○        |                   |                |
| 5 | エピソード詳細 | episode_detail       | VARCHAR(100) |    |          |                   |                |
| 6 | エピソード時間 | episode_length       | int          |    | ○        |                   |                |
| 7 | エピソード公開日 | episode_release_date | datetime     |    | ○        |                   |                |
