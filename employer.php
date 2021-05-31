<?php
require('database.php');
require('employer_funcs.php');
$employers = get_employers_info();
$EmployerID = 'A001';
delete_employer($EmployerID);
$EmployerID = 'AlanID';
$Employer = 'Alan';
$phone = 'kdlkdl';
add_employer(EmployerID, $Employer, $Phone);
?>
<main>
    <h1>Employers:</h1>
    <table>
        <tr>
            <th>EmployerID</th>
            <th>Employer</th>
            <th>Phone</th>
            <th>&nbsp;</th>
        </tr>
        <?php foreach ($employers as $employer) : ?>
        <tr>
            <td><?php echo $employer['EmployerID']; ?></td>
            <td><?php echo $employer['Employer']; ?></td>
            <td><?php echo $employer['Phone']; ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</main>
