## program_genre（番組×ジャンル）テーブル定義

| # | 論理名     | 物理名      | 型  | PK | NOT NULL | FK                     | 備考 |
|---:|------------|-------------|-----|:--:|:--------:|------------------------|------|
| 1 | 番組ID     | program_id  | int | ○  | ○        | program.program_id     |      |
| 2 | ジャンルID | genre_id    | int | ○  | ○        | genre.genre_id         |      |
