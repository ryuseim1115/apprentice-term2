param(
    [string]$DbName ="term2"
)

(Get-Content create/create_database.sql) -replace "__DB_NAME__",$DbName | mysql --login-path=term2 --default-character-set=utf8mb4
Write-Host 'Database setup completed'

Get-Content create/create_show_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:show_master setup completed'


Get-Content create/create_genre_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:genre_master setup completed'

Get-Content create/create_time_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:time_master setup completed'

Get-Content create/create_ch_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:ch_master setup completed'

Get-Content create/create_show_genre.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:show_genre setup completed'

Get-Content create/create_season_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:season_master setup completed'

Get-Content create/create_episode_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:episode_master setup completed'

Get-Content create/create_time_ch.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:time_ch setup completed'

Get-Content create/create_view_info.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'table:view_info setup completed'

Get-Content insert/insert_show_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:show_master completed'

Get-Content insert/insert_genre_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:genre_master completed'

Get-Content insert/insert_show_genre.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:show_genre completed'

Get-Content insert/insert_season_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:season_master completed'

Get-Content insert/insert_episode_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:episode_master completed'

Get-Content insert/insert_time_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:time_master completed'

Get-Content insert/insert_ch_master.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:ch_master completed'

Get-Content insert/insert_time_ch.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:time_ch completed'

Get-Content insert/insert_view_info.sql -Encoding utf8 | mysql --login-path=term2 --default-character-set=utf8mb4 $DbName
Write-Host 'insert:view_info completed'


Write-Host 'All setup completed'
