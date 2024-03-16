#!/bin/bash

flagi=$(getopt -o hd -- "$@")

eval set -- "$flagi"
while [ : ]; do
  case "$1" in
    -d)
        date
        shift
        ;;
    -h)
        echo "uzupełnij to"
        shift
        ;;
    --) shift; 
        break 
        ;;
  esac
done
