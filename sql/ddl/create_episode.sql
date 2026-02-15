create table
    episode (
        episode_id int auto_increment comment 'エピソードID',
        season_id int comment 'シーズンID',
        episode_no int not null comment 'エピソード番号',
        episode_title VARCHAR(100) not null comment 'エピソードタイトル',
        episode_detail VARCHAR(100) comment 'エピソード詳細',
        episode_length int not null comment 'エピソード時間',
        episode_release_date datetime comment 'エピソード公開日',
        primary key (episode_id),
        constraint fk_episode_season foreign key (season_id) references season (season_id) on delete cascade
    ) comment = 'エピソード';