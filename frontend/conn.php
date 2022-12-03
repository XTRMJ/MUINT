<?php

$conn;

function conn(){
    $host = "localhost";
    $user = "postgres";
    $dbname= "MUINT";
    $pass = "1";
    return $conn = pg_connect("host=".$host." user=".$user." password=".$pass." dbname=".$dbname);
}

function endConn(){
    #if($conn) pg_close($conn);
}
?>