select
    sh.program_title as '番組タイトル',
    sum(vi.view_cnt) as '7日間の合計視聴数'
from
    program as sh
    left join season as se on se.program_id = sh.program_id
    left join episode as ep on ep.season_id = se.season_id
    left join broadcast as br on ep.episode_id = br.episode_id
    left join view_info as vi on vi.broadcast_id = br.broadcast_id
where
    br.broadcast_start >= curdate()
    and br.broadcast_start < date_add(curdate(), interval 7 day)
group by
    sh.program_id,
    sh.program_title
order by
    sum(vi.view_cnt) desc
limit
    2;