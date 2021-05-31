<?php
function get_employers_info() {
    global $db;
    $query = 'SELECT * FROM Employers';
    $statement = $db->prepare($query);
    $statement->execute();
    $employers = $statement->fetchAll();
    $statement->closeCursor();
    return $employers;
}

function add_employer($EmployerID, $Employer, $Phone) {
    global $db;
    $db->beginTransaction();
    $query = 'INSERT INTO Employers
                 (EmployerID, Employer, Phone)
              VALUES
                 (:EmployerID, :Employer, :Phone)';
    $statement = $db->prepare($query);
    $statement->bindValue(':EmployerID', $EmployerID);
    $statement->bindValue(':Employer', $Employer);
    $statement->bindValue(':Phone', $Phone);
    $statement->execute();
    $statement->closeCursor();
    $db->commit();
}

function delete_employer($EmployerID) {
    global $db;
    $db->beginTransaction();
    $query = 'DELETE FROM Employers
              WHERE EmployerID = :employer_id';
    $statement = $db->prepare($query);
    $statement->bindValue(':employer_id', $EmployerID);
    $statement->execute();
    $statement->closeCursor();
    if ($result) {
        $query = 'DELETE FROM Employers
              WHERE EmployerID = :employer_id';
        $statement = $db->prepare($query);
        $statement->bindValue(':employer_id', $EmployerID);
        $result = $statement->execute();
        $statement->closeCursor();
    }
    if ($result) {
        $db->commit();
    } else {
        $db->rollback();
        // insert an error into log table
    }
}

function get_jobs_for_employer($EmployerID) {
    global $db;
    $query = 'SELECT * FROM Jobs
              WHERE EmployerID = :employer_id';
    $statement = $db->prepare($query);
    $statement->bindValue(':employer_id', $EmployerID);
    $statement->execute();
    $employers = $statement->fetchAll();
    $statement->closeCursor();
    return $employers;
}
?>
