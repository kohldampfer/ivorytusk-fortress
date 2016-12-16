#!/bin/bash

EXISTS_ANTLR4=$(which antlr4)
EXISTS_PYTHON3=$(which python3)
EXISTS_GIT=$(which git)

echo "Checking if antlr4 exists ..."
if [ -z "$EXISTS_ANTLR4" ]; then
	echo "EXISTS_ANTLR4 is empty. Could not find 'antlr4' command."
	exit -1
fi

echo "Checking if python3 exists ..."
if [ -z "$EXISTS_PYTHON3" ]; then
	echo "EXISTS_PYTHON3 is empty. Could not find 'python3' command."
	exit -1
fi

echo "Checking if git exists ..."
if [ -z "$EXISTS_GIT" ]; then
	echo "EXISTS_GIT is empty. Could not find 'git' command."
	exit -1
fi

pushd $(pwd)/PHP
echo "Calling antlr4 on PHPLexer_Python.g4 ..."
antlr4 -Dlanguage=Python3 PHPLexer_Python.g4
echo "Calling antlr4 on PHPParser.g4 ..."
antlr4 -Dlanguage=Python3 PHPParser.g4
popd

echo "Running tests ..."
# pushd $(pwd)/Test
python3 -m unittest Test/PHPTest1.py
# popd
