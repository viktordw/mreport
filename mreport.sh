#!/bin/bash

# ###########################
# mreport - alpha
# ###########################

# Args
# Simple way for get arguments in your bash script
# https://github.com/joubertredrat/bash-args

get_value() {
    arg=$1
    while [[ $# > 0 ]] ; do
    case "$1" in
        -$arg|--$arg)
            echo ${2}
            shift
            break
            ;;
        -$arg=*|--$arg=*)
            echo ${1#*=}
            shift
            break
            ;;
    esac
    shift
    done
}

fn_output_coloring_off () {
  RED=''
  GREEN=''
  YELLOW=''
  BLACK=''
  WHITE=''
  NC=''
  BGREEN=''
  BGRAY=''
  BNC=''
}

fn_output_coloring_on () {
  # Text colors
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  BLACK='\e[30m'
  WHITE='\e[97m'

  # Text color reset
  NC='\033[0m'

  # Background color
  BGREEN='\e[42m'
  BGRAY='\e[47m'

  # Background color reset
  BNC='\e[49m'
}

# ################################################# #
# KONFIGURACIJA                                     #
# ################################################# #

conf_report_file='mreport.txt'
conf_data_dirname='mr_data'

usage () {
  text=''
  text+="Malware Report Utility - MReport\n"
  text+="\n"
  text+="usage: user (u), domain (d), ip, mlist, ll\n"
  text+="    -u, --user [username]\n"
  text+="    -d, --domain [example.com]\n"
  text+="    --ip [suspected IP address]\n"
  text+="    --mlist [true, false]\n"
  text+="    --ll [true, false]\n"
  text+="\n"
  printf "%b" "$text"
}
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
