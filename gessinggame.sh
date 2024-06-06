#!/bin/bash
# File: guessinggame.sh

function check # check if guess is too high or too low
{
	local files=$(ls -1A|wc -l)
	# list one file per line (including hidden ones), count the files
	if [ $1 -gt $files ] # if guess is too high
		then echo "1"
	elif [ $1 -lt $files ] # if guess is too low
		then echo "-1"
	else #if guess is correct
		echo "0"
	fi
}

function start # main part of code
{
	echo "How many files are in the current directory?"
	local flag=2

	while [ $flag -ne 0 ] # till guess is is not correct
	do
		read guess
		if [[ $guess =~ [^0-9] ]] || [ "$guess" = "" ] # if guess is anything other than a whole number
		then
			echo "Please enter a whole number in numerical form"
			let flag=2
		else #if input is valid
			let flag=$(check $guess) # check if guess is correct
		fi

		if [ $flag -eq 1 ] # print messages accordingly
			then echo "Your guess is too high. Please try again."
		elif [ $flag -eq -1 ]
			then echo "Your guess is too low. Please try again."
		fi
	done

	if [ $flag -eq 0 ] # congratulatory message
		then echo "Congratulations! Your guess is correct!"
	fi
}

start # start the main part of the program
