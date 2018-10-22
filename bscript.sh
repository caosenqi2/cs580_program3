#!/bin/bash -vx
LIST='ls'
if [ $# -gt 0 ] ; then
	LIST=$@
	mkdir ./keys
	let VAR=1
	for FILE in $LIST; do
		if [ ! -e $FILE ]; then
			echo "Invalid input: not found file $FILE!"
		fi
		if [ $VAR -lt $# ] ; then
			mv $FILE keys
			let "VAR++"
		fi
	done
	for file in ./keys/* ; do
		cat $file >> ${!#}
	done
else
	echo "Invalid input: no input files!"
fi
