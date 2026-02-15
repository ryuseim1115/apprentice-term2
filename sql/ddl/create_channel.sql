create table
    channel (
        channel_id int auto_increment comment 'チャンネルID',
        channel_name VARCHAR(100) not null comment 'チャンネル名',
        primary key (channel_id),
        unique key uq_channel_name (channel_name)
    ) comment = 'チャンネル'