#!/bin/bash

movies=("RRR" "BAHUBALI" "EEGA" "OG")

echo "first movie : ${movies[0]}"

echo "forth movie : ${movies[3]}"

echo "All movie : ${movies[@]}" # all movies

echo "5th place movie : ${movies[4]}" # the index which is not present ll give blank in output

