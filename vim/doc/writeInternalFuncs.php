<?php
$funcs = get_defined_functions();
$internal_funcs = $funcs['internal'];
foreach($internal_funcs as $func_name){
    echo $func_name."\n";
}
