#!/bin/bash

# ###########################
# mreport - alpha
# ###########################

source libraries/args.sh
source includes/functions.sh
source config.txt

# ################################################# #

# Read arguments
if [ "$#" = 0 ]; then
  usage
  exit 1
else
  user=$(get_value "user" "$@")
  user=$(get_value "u" "$@")
  domain=$(get_value "domain" "$@")
  domain=$(get_value "d" "$@")
  ip=$(get_value "ip" "$@")
  mlist=$(get_value "mlist" "$@")
  ll=$(get_value "ll" "$@")
fi

# ################################################# #
# FUNKCIJE                                          #
# ################################################# #
skip () {
  printf ''
}

date=$(date | awk '{ print $2 "_" $3 "_" $4 }')
report_dir=$(echo "$user-$date")

make_data_dir () {
    mkdir -p ~/$conf_data_dirname
}

make_report_dir () {
  mkdir -p $report_dir
}

# ################################################# #
make_data_dir
make_report_dir

data_path="${conf_data_dirname}${report_dir}"

if [ "$mr_dir" = 'true' ]; then
  skip
else
  skip
fi

if [ -n "$mlist" ]; then
  echo "Retrieving malware list..."
  sudo dwh -u "$user" --mlist > /mlist.txt
else
  skip
fi

if [ -n "$ll" ]; then
  echo "Retrieving list from Last Login file..."
else
  skip
fi

if [ -n "$user" ]; then
  echo "Finding user details..."
else
  skip
fi

if [ -n "$domain" ]; then
  echo "Finding domain details..."
else
  skip
fi

if [ -n "$IP" ]; then
  echo "Finding IP address details..."
else
  skip
fi
