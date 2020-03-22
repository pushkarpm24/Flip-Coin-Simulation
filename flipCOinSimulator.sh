#!/bin/bash -x

# Problem Statement -> Flip a coin to display head or tail
# Author -> Pushkar Morey
# Date -> 20/03/2020

declare -A combinations

combinations=([H]=0 [T]=0 [HH]=0 [HT]=0 [TT]=0 [TH]=0)


function getHeadOrTail() {

if [[ $((RANDOM%2)) -eq 1 ]]
then
      coinResult=H
else
      coinResult=T
fi

}




function  singletCombination() {

for (( index=0; index<$numOfFlip; index++ ))
do
		getHeadOrTail
		if [[ $coinResult == H ]]
		then
				combinations[H]=$((${combinations[H]}+1))

		else
				combinations[T]=$((${combinations[T]}+1))

		fi
done

headPercent=$(((${combinations[H]} * 100)/$numOfFlip))
tailPercent=$(((${combinations[T]} * 100)/$numOfFlip))

}

function doubletCombination() {

for (( index=0; index<$numOfFlip; index++ ))
do
      getHeadOrTail
		result1=$coinResult
		getHeadOrTail
		result2=$coinResult
      if [[ $result1$result2 == HH ]]
      then
            combinations[HH]=$((${combinations[HH]}+1))

      elif [[ $result1$result2 == HT ]]
		then
            combinations[HT]=$((${combinations[HT]}+1))
		elif [[ $result1$result2 == TT ]]
		then
				combinations[TT]=$((${combinations[TT]}+1))
		else
				combinations[TH]=$((${combinations[TH]}+1))
      fi
done

percentHH=$(((${combinations[HH]} * 100)/$numOfFlip))
percentHT=$(((${combinations[HT]} * 100)/$numOfFlip))
percentTT=$(((${combinations[TT]} * 100)/$numOfFlip))
percentTH=$(((${combinations[TH]} * 100)/$numOfFlip))

}


read -p "Enter the number of time flipp the coin.." numOfFlip
singletCombination
echo "HEAD Percentage is:$headPercent%"
echo "Tail Percentage is:$tailPercent%"
echo "**************************************"
echo "SINGLATE COMBINATIONS.."
echo "H=${combinations[H]},T=${combinations[T]}"
echo "**************************************"

doubletCombination
echo "HH Percentage is:$percentHH%"
echo "HT Percentage is:$percentHT%"
echo "TT Percentage is:$percentTT%"
echo "TH Percentage is:$percentTH%"
echo "**************************************"
echo "DOUBLATE COMBINATIONS.."
echo "HH=${combinations[HH]},HT=${combinations[HT]},TT=${combinations[TT]},TH=${combinations[TH]}"



