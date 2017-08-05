all:
	$(MAKE) grammar
	$(MAKE) lex

grammar:
	sudo yacc -d grammar.y

lex:
	sudo flex lex.l
