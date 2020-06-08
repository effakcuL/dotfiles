#!/bin/bash

man ${1} > /dev/null

if [ $? == 16 ] 
then
    man "std::${1}"
else 
    man ${1}
fi
