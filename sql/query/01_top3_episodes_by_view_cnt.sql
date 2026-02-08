select
    e.episode_title as 'エピソードタイトル',
    sum(v.view_cnt) as '視聴数'
from
    episode_master e
    left join broadcast b on b.episode_id = e.episode_id
    left join view_info v on v.broadcast_id = b.broadcast_id
group by
    e.episode_id,
    e.episode_title
order by
    sum(v.view_cnt) desc
limit
    3;