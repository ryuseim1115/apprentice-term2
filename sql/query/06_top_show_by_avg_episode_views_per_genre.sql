select
    genre_view_info.genre_name as 'ジャンル名',
    program_view_info.program_title as '番組タイトル',
    genre_view_info.max_genre_view_cnt as 'エピソード平均視聴数'
from
    (
        select
            ge.genre_id,
            ge.genre_name,
            max(program_view_info.avg_program_view_cnt) as max_genre_view_cnt
        from
            genre as ge
            left join program_genre as sg on sg.genre_id = ge.genre_id
            left join program as sh on sh.program_id = sg.program_id
            left join (
                select
                    program_view_info.program_id,
                    program_view_info.avg_program_view_cnt
                from
                    (
                        select
                            sh.program_id,
                            avg(episode_view_info.view_cnt) as avg_program_view_cnt
                        from
                            program as sh
                            left join season as se on se.program_id = sh.program_id
                            left join episode as ep on ep.season_id = se.season_id
                            left join (
                                select
                                    ep.episode_id,
                                    sum(vi.view_cnt) as view_cnt
                                from
                                    episode as ep
                                    left join broadcast as br on br.episode_id = ep.episode_id
                                    left join view_info as vi on vi.broadcast_id = br.broadcast_id
                                group by
                                    ep.episode_id
                            ) episode_view_info on episode_view_info.episode_id = ep.episode_id
                        group by
                            sh.program_id
                    ) program_view_info
            ) program_view_info on program_view_info.program_id = sh.program_id
        group by
            ge.genre_id,
            ge.genre_name
    ) genre_view_info
    left join program_genre as sg on sg.genre_id = genre_view_info.genre_id
    left join program as sh on sh.program_id = sg.program_id
    inner join (
        select
            program_view_info.program_id,
            program_view_info.program_title,
            program_view_info.avg_program_view_cnt
        from
            (
                select
                    sh.program_id,
                    sh.program_title,
                    avg(episode_view_info.view_cnt) as avg_program_view_cnt
                from
                    program as sh
                    left join season as se on se.program_id = sh.program_id
                    left join episode as ep on ep.season_id = se.season_id
                    left join (
                        select
                            ep.episode_id,
                            sum(vi.view_cnt) as view_cnt
                        from
                            episode as ep
                            left join broadcast as br on br.episode_id = ep.episode_id
                            left join view_info as vi on vi.broadcast_id = br.broadcast_id
                        group by
                            ep.episode_id
                    ) episode_view_info on episode_view_info.episode_id = ep.episode_id
                group by
                    sh.program_id,
                    sh.program_title
            ) program_view_info
    ) program_view_info on program_view_info.program_id = sh.program_id
    and genre_view_info.max_genre_view_cnt = program_view_info.avg_program_view_cnt