create table
    time_master (
        time_id int auto_increment comment '時間ID',
        broadcast_start datetime not null comment '放送開始',
        broadcast_end datetime not null comment '放送修了',
        primary key (time_id),
        constraint check_time check (broadcast_start < broadcast_end),
        unique key uq_time_time (broadcast_start, broadcast_end)
    ) comment = '時間マスタ'