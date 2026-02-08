create table
    time_ch (
        time_id int comment '時間ID',
        ch_id int not null comment 'チャンネルID',
        episode_id int not null comment 'エピソードID',
        primary key (time_id, ch_id),
        constraint fk_time_ch_time foreign key (time_id) references time_master (time_id) on delete cascade,
        constraint fk_time_ch_ch foreign key (ch_id) references ch_master (ch_id) on delete cascade,
        constraint fk_time_ch_episode foreign key (episode_id) references episode_master (episode_id) on delete cascade
    ) comment = '時間チャンネル関連';