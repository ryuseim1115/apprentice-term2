select
    br.broadcast_start as '放送開始日',
    br.broadcast_end as '放送終了日',
    se.season_no as 'シーズン数',
    ep.episode_no as 'エピソード数',
    ep.episode_title as 'エピソードタイトル',
    ep.episode_detail as 'エピソード詳細'
from
    program as sh
    left join season as se on se.program_id = sh.program_id
    left join episode as ep on ep.season_id = se.season_id
    left join broadcast as br on br.episode_id = ep.episode_id
    left join channel as channel on channel.channel_id = br.channel_id
where
    channel.channel_name like 'ドラマ%'
    and br.broadcast_start >= curdate()
    and br.broadcast_start <= date_add(curdate(), interval 7 day);