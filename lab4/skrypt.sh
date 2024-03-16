#!/bin/bash


function log(){
	for ((i=1;i<=$1;i++))
	do
	printf "Nazwa skryptu: $0\nLog Numer: $i\n$(date)" > log$i.txt
	done
}


flagi=$(getopt -o hdl: --long help,date,log: -- "$@")

eval set -- "$flagi"
while [ : ]; do
  case "$1" in
    -d | --date)
        date
        shift
        ;;
    -h | --help)
        printf "-d\n -l\n-h"
        shift
        ;;
    -l | --log)
		
        log "$2"
        shift 2
        ;;
    --) shift; 
        break 
        ;;
  esac
done
