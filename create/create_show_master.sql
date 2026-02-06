CREATE TABLE
    show_master (
        show_id INT auto_increment comment '番組ID',
        show_title VARCHAR(100) not null comment '番組タイトル',
        show_detail TEXT comment '番組詳細',
        primary key (show_id)
    ) comment = '番組マスタ';