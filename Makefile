all: parser

lex.yy.c: CS315f17_group52.lex
	lex CS315f17_group52.lex 

y.tab.c: CS315f17_group52.yacc
	yacc CS315f17_group52.yacc

parser: lex.yy.c y.tab.c
	gcc y.tab.c -o parser

clean:
	rm lex.yy.c
	rm y.tab.c
	rm parser

run:
	./parser
