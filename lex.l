%{
#include "main.h"
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
#define YYSTYPE char *
void yyerror(char *);
%}

code            "code"
special         ":"
turn		"turn"
send		"send"
on              "on"
pin     	"pin"
for             "for"
num		[0-9]+
ignore		[\t\n]+
%%
{code}          {return CODE;}
{special}       {return SPECIAL; }
{turn}		{return OPRTURN;}
{send}		{return OPRSEND;}	
{on}            {return OPRON;}
{pin}		{return PORT;}
{for}           {return FOR;}
{num}		{ yylval.iValue = atoi(yytext); return INTEGER;}
{ignore}	{ ;}
%%

int yywrap(void) {
return 1;
}
