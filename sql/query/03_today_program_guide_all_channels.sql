select
    ch.ch_id as 'チャンネル名',
    br.broadcast_start as '放送開始時間',
    br.broadcast_end as '放送終了時間',
    se.season_no as 'シーズン数',
    ep.episode_no as 'エピソード数',
    ep.episode_title as 'エピソードタイトル',
    ep.episode_detail as 'エピソード詳細'
from
    season_master as se
    left join episode_master as ep on ep.season_id = se.season_id
    left join broadcast as br on br.episode_id = ep.episode_id
    left join ch_master as ch on ch.ch_id = br.ch_id
where
    br.broadcast_start >= curdate()
    and br.broadcast_start < date_add(curdate(), interval 1 day);