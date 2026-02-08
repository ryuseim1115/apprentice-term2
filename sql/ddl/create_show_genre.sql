CREATE TABLE
    show_genre (
        show_id INT COMMENT '番組ID',
        genre_id INT COMMENT 'ジャンルID',
        PRIMARY KEY (show_id, genre_id),
        constraint fk_show_gener_show foreign key (show_id) references show_master (show_id) on delete cascade,
        constraint fk_show_gener_genre foreign key (genre_id) references genre_master (genre_id) on delete cascade
    ) COMMENT = '番組ジャンル関連';