#!/bin/bash

gcd() {
	r=0
	u=$1
	v=$2
	while [ ! "0" -eq $v ];
	do
		r=`expr $u % $v`
		u=$v
		v=$r
	done
	echo $u
}

is_positive_num() {
	expr $1 + 1 > /dev/null 2>&1
	if [ $? -eq 2 ]
	then
		echo "ERROR: $1, PIZ INPUT A NUMBER"
		exit 1
	fi

	num=`echo "$1" | awk '/[^0-9]/ {print}'`
	if [[ ! -z $num ]]
	then
		echo "ERROR: $1 IS NOT A POSITIVE NUMBER"
		exit 1
	fi
}

if [ "$#" -ne 2 ]
then
	echo "ERROR: PLZ INPUT 2 ARGMENTS"
	exit 1
fi

is_positive_num $1
is_positive_num $2

if [ "$1" -gt "$2" ]
then
	result=`gcd $1 $2`
else
	result=`gcd $2 $1`
fi

echo $result
