<title>Docker test WD</title>
<h1>Hello world from dockerized nginx</h1>

<?php
$dsn = 'mysql:host=db;dbname=dazadi';
$username = 'root';
$password = 'toor';
$options = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
); 

$dbh = new PDO($dsn, $username, $password, $options);


foreach ($dbh->query('select * from varda_dienas where month = 4') as $row) {
        print $row['month'] . "\t";
        print $row['day'] . "\t";
        print $row['names'] . "\n";
    }

echo '------------';
phpinfo();