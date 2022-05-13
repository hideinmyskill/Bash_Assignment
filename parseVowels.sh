#!/bin/bash
#Student Name: Clark Pagutaisidro 
#Student Number: 10521413

parseVowels(){
    #List of words storage
    declare -a zeroVowels
    declare -a oneVowels
    declare -a twoVowels
    declare -a threeVowels
    declare -a fourVowels
    declare -a fiveVowels

    for word in `cat $1 | tr -d '[:punct:]'`; do #select every word in txt file without the punctuations
        if [ ${#word} -ge 4 ]; then #if the word is 4 or more letters run this
            vowels=`grep -o "[aeiou]" <<< $word | wc -l` #Check the vowels count per word from the txt file
            if [ $vowels -eq 0 ]; then   #if vowels in a word contains 0
                zeroVowels+=("[$word]")
            elif [ $vowels -eq 1 ]; then #if vowels in a word contains 1
                oneVowels+=("[$word]")
            elif [ $vowels -eq 2 ]; then  #if vowels in a word contains 2
                twoVowels+=("[$word]")
            elif [ $vowels -eq 3 ]; then #if vowels in a word contains 3
                threeVowels+=("[$word]")
            elif [ $vowels -eq 4 ]; then  #if vowels in a word contains 4
                fourVowels+=("[$word]")
            elif [ $vowels -eq 5 ]; then  #if vowels in a word contains 5
                fiveVowels+=("[$word]")
            fi
        fi
        ((totalWords++)) #Get the total word in the txt file
    done
    wordCount=$((${#zeroVowels[@]}+${#oneVowels[@]}+${#twoVowels[@]}+${#threeVowels[@]}+${#fourVowels[@]}+${#fiveVowels[@]})) # add up the length of each list, which contains the word count of four letter or more in length
    echo -e "The file contains $totalWords, of which $wordCount are four letters or more in length. The vowel count for these $wordCount words are as follows:\n "

    echo -e "${#zeroVowels[@]} contain 0 vowels, these being: \n ${zeroVowels[*]} \n"
    echo -e "${#oneVowels[@]} contain 1 vowels, these being: \n ${oneVowels[@]} \n"
    echo -e "${#twoVowels[@]} contain 2 vowels, these being: \n ${twoVowels[@]} \n"
    echo -e "${#threeVowels[@]} contain 3 vowels, these being: \n ${threeVowels[@]} \n"
    echo -e "${#fourVowels[@]} contain 4 vowels, these being: \n ${fourVowels[@]} \n"
    if ! [[ ${#fiveVowels[@]} = 0 ]]; then #Run if the List contains words stored inside
        echo -e "${#fiveVowels[@]} contain 5 vowels, these being: \n ${fiveVowels[@]} \n"
    else                                    # Run if the list doesn't have any words stored inside.
        echo "There are no words that contain 5 vowels."
    fi
}

while True; do
    read -p "Enter file name: " dirname #Prompt to input the file name

    if [ -f $dirname ]; then #if the directory name exist run this
        echo "File  exists"
        parseVowels $dirname # call the function and pass the name of the txt file that was provided 
        break
    else                     # Run if file doesn't exist
        echo "No file found"
    fi
done
exit 0
© 2022 GitHub, Inc.
Terms
Privacy
