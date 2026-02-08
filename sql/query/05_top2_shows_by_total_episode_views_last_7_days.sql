select
    sh.show_title as '番組タイトル',
    sum(vi.view_cnt) as '7日間の合計視聴数'
from
    show_master as sh
    left join season_master as se on se.show_id = sh.show_id
    left join episode_master as ep on ep.season_id = se.season_id
    left join time_ch as tc on ep.episode_id = tc.episode_id
    left join time_master as tm on tm.time_id = tc.time_id
    left join view_info as vi on vi.episode_id = ep.episode_id
where
    tm.broadcast_start >= curdate()
    and tm.broadcast_start < date_add(curdate(), interval 7 day)
group by
    sh.show_id,
    sh.show_title
order by
    sum(vi.view_cnt) desc
limit
    2;