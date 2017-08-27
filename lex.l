%{
#include "main.h"
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
void yyerror(char *);
%}

code            "code"
special         ":"
turn		"turn"
send		"send"
oprt            "on"
location        "pin"
for             "for"
num		"[0-9]+"

%%
{code}          {return CODE;}
{special}       {return SPCL;}
{turn}		{return TURN;}
{send}		{return SEND;}	
{oprt}          {return OPRT;}
{location}	{return PORT;}
{for}           {return FOR;}
{num}		{ yylval.iValue = atoi(yytext); return INTEGER;}
%%

int yywrap(void) {
return 1;
}
