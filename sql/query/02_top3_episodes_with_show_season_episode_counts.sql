select
    sh.program_title as '番組タイトル',
    se.season_no as 'シーズン数',
    ep.episode_no as 'エピソード数',
    ep.episode_title as 'エピソードタイトル',
    sum(vi.view_cnt) as '視聴数'
from
    program sh
    left join season se on se.program_id = sh.program_id
    left join episode ep on ep.season_id = se.season_id
    left join broadcast tc on tc.episode_id = ep.episode_id
    left join view_info vi on vi.broadcast_id = tc.broadcast_id
group by
    sh.program_title,
    se.season_no,
    ep.episode_no,
    ep.episode_title
order by
    sum(vi.view_cnt) desc
limit
    3;