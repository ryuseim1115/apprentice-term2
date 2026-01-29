create table
    broadcast_master (
        broadcast_id int auto_increment '放送ID',
        broadcast_start datetime not null '放送開始',
        broadcast_end datetime not null '放送修了',
        primary key (broadcast_id)
    ) comment = '放送マスタ'