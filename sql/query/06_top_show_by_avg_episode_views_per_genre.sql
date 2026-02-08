select
    show_title_avg.genre_name as 'ジャンル名',
    show_title_avg.show_title as '番組タイトル',
    show_title_avg.avg_view_cnt as 'エピソード平均視聴数'
from
    (
        select
            show_title.genre_id,
            max(show_title.avg_view_cnt) as max_view_cnt
        from
            (
                select
                    shg.genre_id,
                    avg(vi.view_cnt) as avg_view_cnt
                from
                    show_master as sh
                    left join season_master as se on se.show_id = sh.show_id
                    left join episode_master as ep on ep.season_id = se.season_id
                    left join view_info as vi on vi.episode_id = ep.episode_id
                    left join show_genre as shg on shg.show_id = sh.show_id
                group by
                    sh.show_id,
                    shg.genre_id
            ) show_title
        group by
            show_title.genre_id
    ) show_title_max
    left join (
        select
            sh.show_title,
            shg.genre_id,
            gm.genre_name,
            avg(vi.view_cnt) as avg_view_cnt
        from
            show_master as sh
            left join season_master as se on se.show_id = sh.show_id
            left join episode_master as ep on ep.season_id = se.season_id
            left join view_info as vi on vi.episode_id = ep.episode_id
            left join show_genre as shg on shg.show_id = sh.show_id
            left join genre_master as gm on gm.genre_id = shg.genre_id
        group by
            sh.show_title,
            sh.show_id,
            shg.genre_id,
            gm.genre_name
    ) show_title_avg on show_title_avg.genre_id = show_title_max.genre_id
    and show_title_avg.avg_view_cnt = show_title_max.max_view_cnt
order by
    show_title_avg.genre_id;