#!/bin/bash -x

# Problem Statement -> Flip a coin to display head or tail
# Author -> Pushkar Morey
# Date -> 20/03/2020

declare -A combinations

combinations=([H]=0 [T]=0 [HH]=0 [HT]=0 [TT]=0 [TH]=0 [HHH]=0 [HHT]=0 [HTT]=0 [HTH]=0 [TTT]=0 [TTH]=0 [THH]=0 [THT]=0)


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

function tripletCombination() {

for (( index=0; index<$numOfFlip; index++ ))
do
      getHeadOrTail
      result1=$coinResult
      getHeadOrTail
      result2=$coinResult
		getHeadOrTail
		result3=$coinResult

		if [[ $result1$result2$result3 == HHH ]]
		then
				combinations[HHH]=$((${combinations[HHH]}+1))

		elif [[ $result1$result2$result3 == HHT ]]
		then
				combinations[HHT]=$((${combinations[HHT]}+1))
		elif [[ $result1$result2$result3 == HTT ]]
		then
            combinations[HTT]=$((${combinations[HTT]}+1))
		elif [[ $result1$result2$result3 == HTH ]]
		then
				combinations[HTH]=$((${combinations[HTH]}+1))

		elif [[ $result1$result2$result3 == TTT ]]
		then
				combinations[TTT]=$((${combinations[TTT]}+1))
		elif [[ $result1$result2$result3 == TTH ]]
		then
				combinations[TTH]=$((${combinations[TTH]}+1))
		elif [[ $result1$result2$result3 == THH ]]
      then
            combinations[THH]=$((${combinations[THH]}+1))
		elif [[ $result1$result2$result3 == THT ]]
		then
            combinations[THT]=$((${combinations[TTH]}+1))
		fi
done

percentHHH=$(((${combinations[HHH]} * 100)/$numOfFlip))
percentHHT=$(((${combinations[HHT]} * 100)/$numOfFlip))
percentHTT=$(((${combinations[HTT]} * 100)/$numOfFlip))
percentHTH=$(((${combinations[HTH]} * 100)/$numOfFlip))
percentTTT=$(((${combinations[TTT]} * 100)/$numOfFlip))
percentTTH=$(((${combinations[TTH]} * 100)/$numOfFlip))
percentTHH=$(((${combinations[THH]} * 100)/$numOfFlip))
percentTHT=$(((${combinations[THT]} * 100)/$numOfFlip))

}

function findMaxOutput() {

	maxOutcomes=0
   maxOutput=0
	for k in ${!combinations[@]}
   do

      if [[ $maxOutcomes -lt ${combinations["$k"]} ]]
      then
         maxOutcomes=${combinations["$k"]}
         maxOutput=$k
      fi
   done

   echo "Maximum Occurances are $maxOutcomes --> $maxOutput"

}

function getCombination () 
{

while [[ $temp -eq $choice ]]
do
read -p "Enter the number of time flipp the coin.." numOfFlip
read -p "Enter your choice ::" choice

case $choice in
	1 )

		singletCombination
		echo "SINGLATE COMBINATIONS.."
		echo "H=${combinations[H]},T=${combinations[T]}"
		findMaxOutput 0 0 ;;
	2 )

		doubletCombination
		echo "DOUBLATE COMBINATIONS.."
		echo "HH=${combinations[HH]},HT=${combinations[HT]},TT=${combinations[TT]},TH=${combinations[TH]}"
   	findMaxOutput 0 0 ;;
	3 )

		tripletCombination
		echo "TRIPLATE COMBINATIONS.."
		echo "HHH=${combinations[HHH]},HHT=${combinations[HHT]},HTT=${combinations[HTT]},HTH=${combinations[HTH]},TTT=${combinations[TTT]},TTH=${combinations[TTH]},THH=${combinations[THH]},THT=${combinations[THT]}"
		findMaxOutput 0 0 ;;
	4 )
		temp=1 ;;


esac
done
}


getCombination


