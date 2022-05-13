#!/bin/bash
#Student Name: Clark Pagutaisidro 
#Student Number: 10521413

declare -a primes

#loop to keep prompting with start range
while true; do
    read -p "Start range: " minr #prompt user with a Start range
    if [[ $minr =~ ^[0-9]+$ ]]; then # this will check if the input is a number 
        if [ $minr -ge 2 ]; then #Input should be greater or equal to 2, below that would prompt error
            break
        else # If the input is below 2 it will put an error
            echo "Invalid Start Range Value. Start range must be an integer greater than 1. Please try again."
        fi
    else # Check if the Input is not a number
        echo "Invalid Start Range Value. Start range must be an integer greater than 1. Please try again."
    fi
done
while true; do
    read -p "End range: " maxr 
    if [[ $maxr =~ ^[0-9]+$ ]]; then # this will check if the input is a number
        if [ $maxr -ge $(($minr+2)) ]; then # An End range input number should be 2 points greater than the Start range
            break
        else # if the end range input number is below Start range number or not 2 points greater than the start range, prompt an error
            echo "Invalid Start Range Value. Start range must be an integer greater than 1. Please try again."
        fi
     else # Check if the Input is not a number
        echo "Invalid Start Range Value. Start range must be an integer greater than 1. Please try again."
    fi
done

setter="" # Storing false or true string
num=0 # storing number for each prime number chosen

#loop count from the Start range till maxi range
for (( i=$minr; i<=$maxr; i++ )); do # This loop goes to each iteration from Start range to End range
    #check if its a prime number or not
    for (( v=2; v<=$i-1; v++)); do # This loop iterates starting from 2 to the I variable which is adding up every iteration
        if [ $(($i%$v)) -eq 0 ]; then # This will divide each number starting from 2. EG. 100/2, 100/3, 100/4 till it reach the same number to see if its divisible to more than 1 factor 
            setter="false" # Set the setter to false to keep from duplicating numbers when stored in a list
            num=$i #current number in the iteration added to num variable
            break
        else
            setter="true" # Set the setter to true to store the current numer to the list
            num=$i #current number in the iteration added to num variable
        fi
    done
    #boolean if the current number is prime or not prime
    if [ $setter = "true" ]; then # store current value to the prime list if the setter is true
        primes+=($num)
    fi
done

#Adding the value inside the prime list via loop.
count=0 #temporary storage for the value result.
for add in "${primes[@]}"; do # Select each number from the list, one by one
    res=`expr $count + $add` # add the count from each number in the list
    count=$res # Add the result to the temporary storage (variable)
done

if [ ${#primes[@]} -eq 0 ]; then # If there are no primes that has found in a list prompt user
    echo -e " \n\nThere are no prime number(s) exist within $minr and $maxr.\n\n"
else
    echo -e "\n\n\nThere are ${#primes[@]} primes found! \n" 
    echo -e "Primes are: \n"${primes[@]} "\n"
    echo -e "Total sum of : $count"
fi

exit 0
