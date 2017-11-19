all: parser

lex.yy.c: lex.l
	lex lex.l 

y.tab.c: yacc.y
	yacc yacc.y

parser: lex.yy.c y.tab.c
	gcc y.tab.c -o parser

clean:
	rm lex.yy.c
	rm y.tab.c
	rm parser

run:
	./parser
