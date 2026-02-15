## program（番組）テーブル定義

| # | 論理名   | 物理名         | 型            | PK | NOT NULL | FK | 備考            |
|---:|----------|----------------|---------------|:--:|:--------:|:--:|-----------------|
| 1 | 番組ID   | program_id     | int           | ○  | ○        |    | auto_increment  |
| 2 | 番組名   | program_name   | VARCHAR(100)  |    | ○        |    |                 |
| 3 | 番組詳細 | program_detail | TEXT          |    |          |    |                 |
