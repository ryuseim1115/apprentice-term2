CREATE TABLE
    season (
        season_id INT AUTO_INCREMENT comment 'シーズンID',
        program_id INT not null comment '番組ID',
        season_no INT not null comment 'シーズン番号',
        PRIMARY key (season_id),
        constraint fk_season foreign key (program_id) references program (program_id) on delete cascade
    ) COMMENT = 'シーズン';