CREATE TABLE
    show_genre (
        show_id INT COMMENT '番組ID',
        genre_id INT COMMENT 'ジャンルID',
        PRIMARY KEY (show_id, genre_id)
    ) COMMENT = '番組ジャンル関連';