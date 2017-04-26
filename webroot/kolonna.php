<h1>Kolonna data pivot test</h1>


<?

$input = [
	['saloon' => 1,'price' => 11,'service'=>'pak1'],
	['saloon' => 1,'price' => 12,'service'=>'pak2'],
	['saloon' => 1,'price' => 13,'service'=>'pak3'],
	['saloon' => 2,'price' => 21,'service'=>'pak1'],
	['saloon' => 2,'price' => 22,'service'=>'pak2'],
	['saloon' => 2,'price' => 23,'service'=>'pak3'],
];

echo "<pre>=INPUT=<br />";
printf("Saloon\tPrice\tService\n");

foreach ($input as $s) {
 printf("%s\t", $s['saloon']);   
 printf("%s\t", $s['price']);
 printf("%s\n", $s['service']);
}
echo '</pre>';


require('PHPivot/PHPivot.php');

$output = PHPivot::create($input)
        ->setPivotRowFields('service')
        ->setPivotColumnFields('saloon')
        ->setPivotValueFields('price')
        ->generate();
echo $output->toHtml();



