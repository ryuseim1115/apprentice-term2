select
    channel.channel_id as 'チャンネル名',
    br.broadcast_start as '放送開始時間',
    br.broadcast_end as '放送終了時間',
    se.season_no as 'シーズン数',
    ep.episode_no as 'エピソード数',
    ep.episode_title as 'エピソードタイトル',
    ep.episode_detail as 'エピソード詳細'
from
    season as se
    left join episode as ep on ep.season_id = se.season_id
    left join broadcast as br on br.episode_id = ep.episode_id
    left join channel as channel on channel.channel_id = br.channel_id
where
    br.broadcast_start >= curdate()
    and br.broadcast_start < date_add(curdate(), interval 1 day);