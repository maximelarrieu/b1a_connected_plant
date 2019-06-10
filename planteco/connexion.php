<?php
  $server = "localhost";
  $db = "planteco";
  $login = "root";
  $password = "";
  $connexion = new PDO("mysql:host=$server;dbname=$db", $login, $password);
  $connexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
