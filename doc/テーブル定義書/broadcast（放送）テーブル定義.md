## broadcast（放送）テーブル定義

| # | 論理名     | 物理名          | 型       | PK | NOT NULL | FK                 | 備考           |
|---:|------------|-----------------|----------|:--:|:--------:|--------------------|----------------|
| 1 | 放送ID     | time_id         | int      | ○  | ○        |                    | auto_increment |
| 2 | 放送開始   | broadcast_start | datetime |    | ○        |                    |                |
| 3 | 放送終了   | broadcast_end   | datetime |    | ○        |                    |                |
| 4 | チャンネルID | channel_id         | int      |    | ○        | channel.channel_id      |                |
| 5 | エピソードID | episode_id    | int      |    | ○        | episode.episode_id |                |
