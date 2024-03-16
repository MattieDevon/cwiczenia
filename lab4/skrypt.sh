#!/bin/bash


function log(){
	for ((i=1;i<=$1;i++))
	do
	printf "Nazwa skryptu: $(basename "$0")\nLog Numer: $i\n$(date)" > log$i.txt
	done
}
function error(){
	mkdir -p error
	for ((i=1;i<=$1;i++))
	do
	echo "Error" > error/error$i.txt
	done
}

flagi=$(getopt -o hdl:e: --long help,date,log:,init,error: -- "$@")

eval set -- "$flagi"
while [ : ]; do
  case "$1" in
    -d | --date)
        date
        shift
        ;;
    -h | --help)
        printf "-d --date\n-l --long\n-h --help"
        shift
        ;;
    -l | --log)
        log "$2"
        shift 2
        ;;
    -e | --error)
        error "$2"
        shift 2
        ;;
	--init)
		cp "$BASH_SOURCE" "$(pwd)/script.sh"
		shift
		;;
    --) shift; 
        break 
        ;;
  esac
done


echo "The script you are running has:"
echo "basename: [$(basename "$0")]"
echo "dirname : [$(dirname "$0")]"
echo "pwd     : [$(pwd)]"
