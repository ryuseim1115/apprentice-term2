create table
    broadcast_ch (
        broadcast_id int comment '放送ID',
        ch_id int not null comment 'チャンネルID',
        episode_id int not null comment 'エピソードID',
        primary key (broadcast_id)
    ) comment = '放送チャンネル関連';