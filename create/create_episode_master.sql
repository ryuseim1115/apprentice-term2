create table
    episode_master (
        episode_id int auto_increment comment 'エピソードID',
        season_id int comment 'シーズンID',
        episode_name VARCHAR(100) comment 'エピソード名',
        episode_detail VARCHAR(100) comment 'エピソード詳細',
        episode_length int comment 'エピソード時間',
        episode_release_date datetime comment 'エピソード公開日',
        primary key (episode_id),
        constraint fk_episode_master_season foreign key (season_id) references season_master (season_id) on delete cascade
    ) comment = 'エピソードマスタ';