<?php

$path = __DIR__;
$inputFilePath = $path . '/episode_data.csv';
$outFilePath = $path . '/show_master.csv';

$file = fopen($inputFilePath, 'r');

$show_master = [];
$unique = [];
while ((($row = fgetcsv($file))) != false) {
    $title = $row[0];
    $detail = $row[10];
    $show_id = $row[8];
    $key = $title . $detail;
    $unique[$key] = [$show_id, $title, $detail];
}

$show_master = array_values($unique);
$outFile = fopen($outFilePath, 'w');
foreach ($show_master as $s) {
    fputcsv($outFile, $s);
}
