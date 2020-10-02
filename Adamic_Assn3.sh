#! /bin/bash

# BIOL 7863 Assignment 3
# Created by: Emily Adamic 10/01/2020
# This script will create one separate data file containing all BTS_data.txt rows for each unique snake.

# Make an intermediate file containing unique snake IDs.
cut -f1 BTS_data.txt | sort | uniq | grep -v ID > snake_IDs.txt

# Iterate through snake_IDs, pulling out the data for that snake.
COUNTER=0
while read line
do grep $line BTS_data.txt > file_$line.txt
let COUNTER=COUNTER+1
printf "."
done < snake_IDs.txt

#rm snake_IDs.txt

echo "We created $COUNTER snake files!"

# Make sure # files created == # unique snakes.
