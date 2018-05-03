#!/bin/bash

# declare arguments from command line, like: --arg1 value1
while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        if [[ ${#2} != 0 &&  $2 != *"--"* ]]; then
            declare $v="$2"
        else
            declare $v="true"
        fi
   fi
  shift
done