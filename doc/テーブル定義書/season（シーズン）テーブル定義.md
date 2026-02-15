## season（シーズン）テーブル定義

| # | 論理名     | 物理名       | 型            | PK | NOT NULL | FK                  | 備考           |
|---:|------------|--------------|---------------|:--:|:--------:|---------------------|----------------|
| 1 | シーズンID | season_id    | int           | ○  | ○        |                     | auto_increment |
| 2 | 番組ID     | program_id   | int           |    | ○        | program.program_id  |                |
| 3 | シーズン名 | season_name  | VARCHAR(100)  |    | ○        |                     |                |
