#!/bin/bash

# ansible -list > list-ansible
LIST="$HOME/.dotfile/ansible_list.txt"
cat $LIST | fzf | xargs ansible-doc | less -p EXAMPLE

