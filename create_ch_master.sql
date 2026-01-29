create table
    ch_master (
        ch_id int auto_increment comment 'チャンネルID',
        ch_name VARCHAR(100) not null comment 'チャンネル名',
        primary key (ch_id)
    ) comment = 'チャンネルマスタ'