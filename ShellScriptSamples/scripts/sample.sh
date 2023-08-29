#!/bin/bash

ARRAY=()
while true; do
    case $1 in
        [)  ;;
        ,)  ;;
        ])  break ;;
        *]) 
            ARRAY+=($(echo $1 | sed -r "s/(\[|\])//g")) 
            break 
            ;; 
        *) ARRAY+=($(echo $1 | sed -r "s/(\[|\])//g"))
    esac
    shift
done
ARRAY=$(echo ${ARRAY[@]} | sed -e "s/ ,/,/g" -e "s/, /,/g" -e "s/ , /,/g")
echo Array $ARRAY
