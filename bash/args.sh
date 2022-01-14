#!/bin/bash
# Template bash script
# Includes example of parsing aruments without using getopt
#

PARAMS=""

help_message() {
  cat <<HELP
Usage: 
   args [OPTION] pos1 pos2
HELP
}

while (( "$#" )); do
  case "$1" in
    -a|--my-boolean-flag)
      MY_FLAG=0
      shift
      ;;
    -b|--my-flag-with-argument)
      if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
        MY_FLAG_ARG=$2
        shift 2
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    -h|--help)
      help_message
      exit 1
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS+=( $1 )
      shift
      ;;
  esac
done

# set positional arguments in their proper place
set -- "${PARAMS[@]}"

# Check # of positional arguments if desired
#if [[ $# -ne 2 ]]; then
#  echo "ERROR: two arguments required"
#  help_message
#  exit 1
#fi