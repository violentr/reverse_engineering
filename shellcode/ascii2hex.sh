#/usr/bin/env bash
 STR=$1
 HEXVAL=$(printf $1 | xxd)
 echo "$HEXVAL"
