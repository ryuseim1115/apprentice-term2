-- ウィンドウ関数なし　（ジャンル、番号ごと平均視聴数の最大が2つ以上あれば、重複分だけレコード出力される）
select
    ge.genre_id,
    show_title_avg.show_title,
    show_title_avg.avg_view_cnt
from
    genre_master as ge
    left join (
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
    ) show_title_max on show_title_max.genre_id = ge.genre_id
    left join (
        select
            sh.show_title,
            shg.genre_id,
            avg(vi.view_cnt) as avg_view_cnt
        from
            show_master as sh
            left join season_master as se on se.show_id = sh.show_id
            left join episode_master as ep on ep.season_id = se.season_id
            left join view_info as vi on vi.episode_id = ep.episode_id
            left join show_genre as shg on shg.show_id = sh.show_id
        group by
            sh.show_title,
            sh.show_id,
            shg.genre_id
    ) show_title_avg on show_title_avg.genre_id = show_title_max.genre_id
    and show_title_avg.avg_view_cnt = show_title_max.max_view_cnt