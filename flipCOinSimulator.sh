#!/bin/bash -x

# Problem Statement -> Flip a coin to display head or tail
# Author -> Pushkar Morey
# Date -> 20/03/2020

if [[ $((RANDOM%2)) -eq 1 ]]
then
      echo "HEADS"
else
      echo "TAILS"
fi


