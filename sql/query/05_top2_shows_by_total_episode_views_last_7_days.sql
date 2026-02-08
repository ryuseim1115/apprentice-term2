select
    sh.show_title as '番組タイトル',
    sum(vi.view_cnt) as '7日間の合計視聴数'
from
    show_master as sh
    left join season_master as se on se.show_id = sh.show_id
    left join episode_master as ep on ep.season_id = se.season_id
    left join broadcast as br on ep.episode_id = br.episode_id
    left join view_info as vi on vi.broadcast_id = br.broadcast_id
where
    br.broadcast_start >= curdate()
    and br.broadcast_start < date_add(curdate(), interval 7 day)
group by
    sh.show_id,
    sh.show_title
order by
    sum(vi.view_cnt) desc
limit
    2;