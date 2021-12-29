#!/bin/bash

#############################################
# https://github.com/viktordw/mreport       #
# License:                                  #
# Publish date: Nov 17, 2021.               #
# Version: 0.1-Alpha                        #
#############################################
path=$(pwd)

source ${path}/libraries/args.sh
source ${path}/includes/functions.sh
source ${path}/includes/main.sh
source ${path}/config.txt
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
make_data_dir
make_report_dir

data_path="${conf_data_dirname}${report_dir}"

main
