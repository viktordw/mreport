#!/bin/bash

#############################################
# https://github.com/viktordw/mreport       #
# License:                                  #
# Publish date: Nov 17, 2021.               #
# Version: 0.1-Alpha                        #
#############################################

export script=$(realpath $0)
export scriptpath=$(dirname $script)

# source ${scriptpath}/libraries/args.sh
source ${scriptpath}/includes/functions.sh
source ${scriptpath}/includes/main.sh
source ${scriptpath}/config.txt
# ######################################### #

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

# ######################################### #
# make_data_dir
# make_report_dir

# data_path="${conf_data_dirname}${report_dir}"

main () {
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
}
