## view_info（視聴情報）テーブル定義

| # | 論理名   | 物理名       | 型  | PK | NOT NULL | FK                     | 備考           |
|---:|----------|--------------|-----|:--:|:--------:|------------------------|----------------|
| 1 | 視聴ID   | view_id      | int | ○  | ○        |                        | auto_increment |
| 2 | 放送ID   | broadcast_id | int |    | ○        | broadcast.broadcast_id |                |
| 3 | 視聴数   | view_cnt     | int |    | ○        |                        |                |
