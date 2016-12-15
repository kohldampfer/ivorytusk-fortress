from antlr4 import *
from PHP.PHPLexer_Python import *
from PHP.PHPParser import *
import unittest

class PHPTest1(unittest.TestCase):
	def readFileAndCheck(self):
		# read file
		txt = open('PHPTest1.php')
		content = txt.read()
		txt.close()

		# parse content
		lexer = PHPLexer_Python(text)
		stream = ComomTokenStream(lexer)
		parser = PHPParser(stream)
		tree = parser.htmlDocument()

if __name__ == '__main__':
	unittest.main()
	