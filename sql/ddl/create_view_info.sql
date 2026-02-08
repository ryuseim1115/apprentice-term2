create table
    view_info (
        view_id int auto_increment comment '視聴ID',
        broadcast_id int not null comment '放送ID',
        view_cnt int not null comment '視聴数',
        primary key (view_id),
        constraint view_info_view foreign key (broadcast_id) references broadcast (broadcast_id) on delete cascade
    ) comment = '視聴情報';