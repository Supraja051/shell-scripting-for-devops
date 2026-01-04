#!/bin/bash
<< disclaimer
This is just for infotainment purpose
disclaimer
function isloyal() {
read -p "Enter the name: " name
read -p "Jetha ka pyaar %" pyaar
if [[ $name == 'sam' ]];
then 
     echo "sam is loyal"
elif [[ $pyaar -ge 100 ]]
then
	echo "sam is loyal"
else
echo "sam is not loyal"
fi
}
isloyal sam
