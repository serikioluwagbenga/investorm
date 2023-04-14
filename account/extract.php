<?php 
    $string = 'Ruchika < ruchika@example.com > seriki@gmail.com --mnmshh sola@example.com';
    $pattern = '/[a-z0-9_\-\+\.]+@[a-z0-9\-]+\.([a-z]{2,4})(?:\.[a-z]{2})?/i';
    preg_match_all($pattern, $string, $matches);
    var_dump($matches[0]);
?>