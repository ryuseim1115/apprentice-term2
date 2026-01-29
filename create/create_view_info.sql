create table
    view_info (
        view_id int auto_increment comment '視聴ID',
        episode_id int not null comment 'エピソードID',
        view_cnt int not null comment '視聴数',
        primary key (view_id)
    ) comment = '視聴情報';