#! /bin/bash

DATE_FORMAT="%Y-%m-%d %H:%M:%S"

set_date=$1
command=$2

# Start bootstrap.
start_date_s=$(date +"%s")
date +"$date_format" --set="$set_date" > /dev/null
set_date_s=$(date +"%s")
s_diff=$(($set_date_s - $start_date_s))



$command


# Unstrap.
end_date_s=$(date +"%s")
reset_date_s=$(($end_date_s - $s_diff))
reset_date=$(date -d "@$reset_date_s")
date --universal --set="$reset_date" > /dev/null

