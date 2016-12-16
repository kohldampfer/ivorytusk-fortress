from PHP.PHPLexer_Python import *
from PHP.PHPParser import *
from antlr4 import *

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
print(output)
