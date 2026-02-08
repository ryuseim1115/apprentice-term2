select
    ch.ch_id as 'チャンネル名',
    tm.broadcast_start as '放送開始時間',
    tm.broadcast_end as '放送終了時間',
    se.season_no as 'シーズン数',
    ep.episode_no as 'エピソード数',
    ep.episode_title as 'エピソードタイトル',
    ep.episode_detail as 'エピソード詳細'
from
    show_master as sh
    left join season_master as se on se.show_id = sh.show_id
    left join episode_master as ep on ep.season_id = se.season_id
    left join time_ch as tc on tc.episode_id = ep.episode_id
    left join time_master as tm on tm.time_id = tc.time_id
    left join ch_master as ch on ch.ch_id = tc.ch_id
where
    tm.broadcast_start >= curdate()
    and tm.broadcast_start <= curdate();