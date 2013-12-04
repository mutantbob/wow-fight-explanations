#!/bin/sh

for i in ../raids/*/*.lua; do
    grep -v 'ACmenu' $i | head -27 | 
	sed -e 's/\(Copyright ... \)\([-0-9]*\)/\12013/' | 
	diff -uw regularHeader.lua - ||
    echo $i
done
