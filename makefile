all:
	$(MAKE) grammar
	$(MAKE) lex
	sudo gcc -c lex.yy.c y.tab.c
	sudo gcc y.tab.o lex.yy.o compiler.c -o testing
grammar:
	sudo yacc -vdy grammar.y --graph

lex:
	sudo flex lex.l
