-- エピソード視聴数トップ3のエピソードタイトルと視聴数を取得 
select
    e.episode_title,
    v.view_cnt
from
    episode_master e
    left join view_info v on v.episode_id = e.episode_id
order by
    v.view_cnt desc
limit
    3;