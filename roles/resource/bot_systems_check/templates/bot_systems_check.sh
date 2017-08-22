#!/bin/bash

if [[ `rit | egrep "×" | wc -l` -gt 0 ]]; then
	rit | egrep "×" | sed 's/\[38;5;9m//g' | sed 's/\[0m//g' | slacktee
fi
