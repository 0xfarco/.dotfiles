#!/bin/bash

vol="$(pamixer --get-volume)"

if [ "$vol" -gt "70" ]; then
        icon="<U+F028> "
elif [ "$vol" -gt "30" ]; then
        icon="<U+F027> "
elif [ "$vol" -gt "0" ]; then
        icon="<U+F026> "
else
	echo "<U+F6A9>" && exit
fi
echo "$vol% " 
