CREATE TABLE
    program (
        program_id INT auto_increment comment '番組ID',
        program_title VARCHAR(100) not null comment '番組タイトル',
        program_detail TEXT comment '番組詳細',
        primary key (program_id)
    ) comment = '番組';