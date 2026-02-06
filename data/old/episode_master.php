<?php

$path = __DIR__;
$inputFilePath = $path . '/episode_data.csv';
$outFilePath   = $path . '/episode_master.csv';

$file = fopen($inputFilePath, 'r');
$header = fgetcsv($file);



$colSeasonId = 'season_id';
$colSeasonNo = 'シーズンNO';
$colShowId   = 'show_id';

$season_master = []; // 
$idx = array_flip($header);
while (($row = fgetcsv($file)) !== false) {
    print_r($row);
    $season_id = $row[$idx[$colSeasonId]];
    $season_no = $row[$idx[$colSeasonNo]];
    $show_id   = $row[$idx[$colShowId]];

    if (!isset($season_master[$season_id])) {
        $season_master[$season_id] = [
            'show_id' => $show_id,
            'cnt' => []
        ];
    }


    $season_master[$season_id]['cnt'][$season_no] =
        ($season_master[$season_id]['cnt'][$season_no] ?? 0) + 1;
}

fclose($file);

$outFile = fopen($outFilePath, 'w');

// ヘッダ出力（不要なら消してOK）
fputcsv($outFile, ['season_id', 'show_id', 'season_no', 'episode_cnt']);

foreach ($season_master as $season_id => $data) {
    $show_id = $data['show_id'];
    foreach ($data['cnt'] as $season_no => $cnt) {
        fputcsv($outFile, [$season_id, $show_id, $season_no, $cnt]);
    }
}

fclose($outFile);
