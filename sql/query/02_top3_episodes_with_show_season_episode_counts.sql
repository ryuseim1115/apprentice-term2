select
    sh.show_title as '番組タイトル',
    se.season_no as 'シーズン数',
    ep.episode_no as 'エピソード数',
    ep.episode_title as 'エピソードタイトル',
    sum(vi.view_cnt) as '視聴数'
from
    show_master sh
    left join season_master se on se.show_id = sh.show_id
    left join episode_master ep on ep.season_id = se.season_id
    left join broadcast tc on tc.episode_id = ep.episode_id
    left join view_info vi on vi.broadcast_id = tc.broadcast_id
group by
    sh.show_title,
    se.season_no,
    ep.episode_no,
    ep.episode_title
order by
    sum(vi.view_cnt) desc
limit
    3;