#!/bin/bash

#############################################
# https://github.com/viktordw/mreport       #
# License:                                  #
# Publish date: Nov 17, 2021.               #
# Version: 0.1-Alpha                        #
#############################################

source libraries/args.sh
source includes/functions.sh
source config.txt
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

fn_main
