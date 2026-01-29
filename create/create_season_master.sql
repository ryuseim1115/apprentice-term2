CREATE TABLE
    season_master (
        season_id INT AUTO_INCREMENT comment 'シーズンID',
        show_id INT not null comment '番組ID',
        season_name VARCHAR(100) not null comment 'シーズン名',
        PRIMARY key (season_id)
    ) COMMENT = 'シーズンマスタ';