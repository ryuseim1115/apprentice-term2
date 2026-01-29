CREATE TABLE
    genre_master (
        genre_id INT AUTO_INCREMENT COMMENT 'ジャンルID',
        genre_name VARCHAR(100) NOT NULL COMMENT 'ジャンル名',
        PRIMARY KEY (genre_id)
    ) COMMENT = 'ジャンルマスタ';