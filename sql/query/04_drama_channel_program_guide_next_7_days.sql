select
    br.broadcast_start as '放送開始日',
    br.broadcast_end as '放送終了日',
    se.season_no as 'シーズン数',
    ep.episode_no as 'エピソード数',
    ep.episode_title as 'エピソードタイトル',
    ep.episode_detail as 'エピソード詳細'
from
    show_master as sh
    left join season_master as se on se.show_id = sh.show_id
    left join episode_master as ep on ep.season_id = se.season_id
    left join broadcast as br on br.episode_id = ep.episode_id
    left join ch_master as ch on ch.ch_id = br.ch_id
where
    ch.ch_name like 'ドラマ%'
    and br.broadcast_start >= curdate()
    and br.broadcast_start <= date_add(curdate(), interval 7 day);