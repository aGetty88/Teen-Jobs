<?php
    $dsn = 'mysql:host=localhost;dbname=TeenJobs';
    $username = 'teenjobs';
    $password = 'teenjobs';

    try {
        $db = new PDO($dsn, $username, $password);
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        include('database_error.php');
        exit();
    }
?>