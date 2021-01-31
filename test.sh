#!/usr/bin/zsh
# -*- coding: utf-8 -*-


echo Hello
for i ({1..2}) {
	echo $i
}
repeat 3 {
	echo 'fuck you'
}
i=5
while (( $i <= 10 )) {
	(( i+=1 ))
	print yes
}
print $i


