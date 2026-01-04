#!/bin/bash
read -p "Enter username" username
echo "you entered $username"
sudo useradd -m $username
echo "New user added"
echo "The characters in $0 are: $1 and $2"
