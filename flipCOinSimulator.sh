#!/bin/bash -x

# Problem Statement -> Flip a coin to display head or tail
# Author -> Pushkar Morey
# Date -> 20/03/2020


function getHeadOrTail() {

if [[ $((RANDOM%2)) -eq 1 ]]
then
      coinResult=HEADS
else
      coinResult=TAILS
fi

}


headCount=0
tailCount=0
function  singletCombination() {

for (( index=0; index<$numOfFlip; index++ ))
do
		getHeadOrTail
		if [[ $coinResult == HEADS ]]
		then
				singletComb[Heads]=$((${singletComb[Heads]}+1))
				((headCount++))
		else
				singletComb[Tails]=$((${singletComb[Tails]}+1))
				((tailCount++))
		fi
done

headPercent=$((($headCount * 100)/$numOfFlip))
tailPercent=$((($tailCount * 100)/$numOfFlip))
echo "HEAD Percentage is:$headPercent%"
echo "Tails Percentage is:$tailPercent%"
}
 
read -p "Enter the number of time flipp the coin.." numOfFlip
singletCombination
