if($args -eq 'pi'){
    ssh pi@peithonking
}elseif($args -eq 'lingaraj'){
    ssh aritra@10.10.0.171
}elseif($args -eq 'mahalasa'){
    ssh aritra@10.10.0.176
}elseif($args -eq 'jagannath'){
    ssh aritra@10.10.0.170
}elseif($args -eq 'anantabasudev'){
    ssh aritra@10.10.0.173
}else{
    echo "Error: No such Remote Found"
}