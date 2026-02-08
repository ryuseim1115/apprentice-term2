select
    genre_view_info.genre_name as 'ジャンル名',
    show_view_info.show_title as '番組タイトル',
    genre_view_info.max_genre_view_cnt as 'エピソード平均視聴数'
from
    (
        select
            ge.genre_id,
            ge.genre_name,
            max(show_view_info.avg_show_view_cnt) as max_genre_view_cnt
        from
            genre_master as ge
            left join show_genre as sg on sg.genre_id = ge.genre_id
            left join show_master as sh on sh.show_id = sg.show_id
            left join (
                select
                    show_view_info.show_id,
                    show_view_info.avg_show_view_cnt
                from
                    (
                        select
                            sh.show_id,
                            avg(episode_view_info.view_cnt) as avg_show_view_cnt
                        from
                            show_master as sh
                            left join season_master as se on se.show_id = sh.show_id
                            left join episode_master as ep on ep.season_id = se.season_id
                            left join (
                                select
                                    ep.episode_id,
                                    sum(vi.view_cnt) as view_cnt
                                from
                                    episode_master as ep
                                    left join broadcast as br on br.episode_id = ep.episode_id
                                    left join view_info as vi on vi.broadcast_id = br.broadcast_id
                                group by
                                    ep.episode_id
                            ) episode_view_info on episode_view_info.episode_id = ep.episode_id
                        group by
                            sh.show_id
                    ) show_view_info
            ) show_view_info on show_view_info.show_id = sh.show_id
        group by
            ge.genre_id,
            ge.genre_name
    ) genre_view_info
    left join show_genre as sg on sg.genre_id = genre_view_info.genre_id
    left join show_master as sh on sh.show_id = sg.show_id
    inner join (
        select
            show_view_info.show_id,
            show_view_info.show_title,
            show_view_info.avg_show_view_cnt
        from
            (
                select
                    sh.show_id,
                    sh.show_title,
                    avg(episode_view_info.view_cnt) as avg_show_view_cnt
                from
                    show_master as sh
                    left join season_master as se on se.show_id = sh.show_id
                    left join episode_master as ep on ep.season_id = se.season_id
                    left join (
                        select
                            ep.episode_id,
                            sum(vi.view_cnt) as view_cnt
                        from
                            episode_master as ep
                            left join broadcast as br on br.episode_id = ep.episode_id
                            left join view_info as vi on vi.broadcast_id = br.broadcast_id
                        group by
                            ep.episode_id
                    ) episode_view_info on episode_view_info.episode_id = ep.episode_id
                group by
                    sh.show_id,
                    sh.show_title
            ) show_view_info
    ) show_view_info on show_view_info.show_id = sh.show_id
    and genre_view_info.max_genre_view_cnt = show_view_info.avg_show_view_cnt