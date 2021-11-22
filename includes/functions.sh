# ################################################# #
# FUNKCIJE                                          #
# ################################################# #

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
