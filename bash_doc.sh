#!/bin/bash

read -p "Your utils: " req
request=$(echo $req | tr ' ' '+')
if [ -n "$request" ];then
    curl -s cheat.sh/$request  | less -R
else
    exit
fi
