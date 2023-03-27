#!/bin/bash
function packageCheck() {
	package=(`ls /usr/share`)
	if printf '%s\n' "${package[@]}" | grep -qx $1; then
		echo "true"
	else
		echo "false"
	fi
}
"""
# Test 
Check=`packageCheck arg`
Check=`packageCheck nano`
if $Check; then
    True
else
    False
fi
"""
