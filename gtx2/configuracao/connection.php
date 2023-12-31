<?php 

namespace gtx2\configuracao;

use PDO;
use PDOException;

function connection(): PDO
{
    $drive    = "pgsql";
    $host     = "localhost";
    $dataBase = "GTX2";
    $user     = "postgres";
    $password = "Danillo@126";
    
    try {
        $conn = new PDO("$drive:host=$host;dbname=$dataBase", $user, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $conn;
    } catch (PDOException $error){
        return "Erro no banco de dados: ". $error->getMessage();
    }
}