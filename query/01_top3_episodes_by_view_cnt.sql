select
    e.episode_title as 'エピソードタイトル',
    v.view_cnt as '視聴数'
from
    episode_master e
    left join view_info v on v.episode_id = e.episode_id
order by
    v.view_cnt desc
limit
    3;