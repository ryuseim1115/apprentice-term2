-- エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得
select
    sh.show_title,
    se.season_no,
    ep.episode_no,
    ep.episode_detail
from
    show_master sh
    left join season_master se on se.show_id = sh.show_id
    left join episode_master ep on ep.season_id = se.season_id
    left join view_info vi on vi.episode_id = ep.episode_id
order by
    vi.view_cnt desc
limit
    3;