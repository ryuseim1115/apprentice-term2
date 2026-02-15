create table
    broadcast (
        broadcast_id int auto_increment comment '放送ID',
        broadcast_start datetime not null comment '放送開始',
        broadcast_end datetime not null comment '放送終了',
        channel_id int not null comment 'チャンネルID',
        episode_id int not null comment 'エピソードID',
        primary key (broadcast_id),
        -- 同一チャンネルで同じ時間帯の放送を禁止
        unique key uq_broadcast_time (broadcast_start, broadcast_end, channel_id),
        -- 開始 < 終了 を保証
        constraint chk_broadcast_time check (broadcast_start < broadcast_end),
        constraint fk_broadcast_channel foreign key (channel_id) references channel (channel_id) on delete cascade,
        constraint fk_broadcast_episode foreign key (episode_id) references episode (episode_id) on delete cascade
    ) comment = '放送情報';