#!/bin/bash

EXISTS_ANTLR4=$(which antlr4)
EXISTS_PYTHON3=$(which python3)

if [ -z "$EXISTS_ANTLR4" ]; then
	echo "EXISTS_ANTLR4 is empty. Could not find 'antlr4' command."
	exit -1
fi

if [ -z "$EXISTS_PYTHON3" ]; then
	echo "EXISTS_PYTHON3 is empty. Could not find 'python3' command."
	exit -1
fi

pushd $(pwd)/PHP
antlr4 -Dlanguage=Python3 PHP.g4
