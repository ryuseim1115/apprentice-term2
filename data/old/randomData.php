<?php

$path = __DIR__;
$filePath = $path . '\episode_data.csv';


$data = fopen($filePath, 'r');
$header = fgetcsv($data);
$show_season_episode = [];
$episode = [];
$episode_no = 0;
$season_no = 0;
$show_no = 0;
$season = [];
while (($row = fgetcsv($data)) != false) {

    if ($row[2] < 12) {
        $episode[] = $row;
    } else {
        $episode[] = $row;
        $season[] = $episode;
        if (count($season) >= 20) {
            $show_season_episode[] = $season;
            $season = [];
        }
        $episode = [];
    }
}
//$show_season_episode[番号NO][シーズンNO][エピソードNO]

$outFilePath = $path . '\episode_data_randam_delete.csv';
$outputData = fopen($outFilePath, 'w');


fputcsv($outputData, $header);
for ($show_no = 0; $show_no < 100; $show_no++) {
    $randSeason = random_int(0, 20);
    for ($season_no = 0; $season_no < 20; $season_no++) {
        if ($season_no === $randSeason) {
            break;
        }
        $randEpisode = random_int(0, 12);
        for ($episode_no = 0; $episode_no < 12; $episode_no++) {
            if ($episode_no === $randEpisode) {
                break;
            }
            fputcsv($outputData, $show_season_episode[$show_no][$season_no][$episode_no]);
            // print_r($show_season_episode[$show_no][$season_no][$episode_no]);
        }
    }
}
