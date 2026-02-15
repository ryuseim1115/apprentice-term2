CREATE TABLE
    program_genre (
        program_id INT COMMENT '番組ID',
        genre_id INT COMMENT 'ジャンルID',
        PRIMARY KEY (program_id, genre_id),
        constraint fk_program_genre_program foreign key (program_id) references program (program_id) on delete cascade,
        constraint fk_program_genre_genre foreign key (genre_id) references genre (genre_id) on delete cascade
    ) COMMENT = '番組ジャンル関連';