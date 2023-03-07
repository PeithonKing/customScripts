if($args -eq 'pi'){
    ssh pi@peithonking
}elseif($args -eq 'lingaraj'){
    ssh aritra@10.10.0.181
}elseif($args -eq 'mahalasa'){
    ssh aritra@10.0.2.45
}else{
    echo "No such Remote Found"
}