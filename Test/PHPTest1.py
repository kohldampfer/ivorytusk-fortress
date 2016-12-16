from antlr4 import *
from PHP.PHPLexer_Python import *
from PHP.PHPParser import *
import unittest
import sys
import os

# add search path for PHPLexer and PHPParser
sys.path.append(os.path.dirname(os.path.realpath(__file__)))

class PHPTest1(unittest.TestCase):
	def readFileAndCheck(self):
		# read file
		txt = open('Test/PHPTest1.php')
		content = txt.read()
		txt.close()

		# parse content
		lexer = PHPLexer_Python(content)
		stream = CommonTokenStream(lexer)
		parser = PHPParser(stream)
		tree = parser.htmlDocument()
		output = tree.toStringTree(recog=parser)
		self.assertEquals('<?php', output)

if __name__ == '__main__':
	unittest.main()
