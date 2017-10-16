%{
    #include "main.h"
    #include <stdio.h>
    #include <stdarg.h>
    #include <stdlib.h>
//    char *name[10];

void  startCompiler();
    
/* prototypes */
nodeType *enm(char* c);
nodeType *opr(int oper,int nops,...);
nodeType *id(int i);
nodeType *con(int value);
nodeType *cmd(char *c);

void freeNode(nodeType *p);
int ex(nodeType *p);
int yylex(void);

void yyerror(char *s);
//int sym[26];                    /* symbol table */
%}

%union {
    int iValue;                 /* integer value */
    char sIndex;                /* symbol table index */
    char *str;                /* symbol table index */
    nodeType *nPtr;             /* node pointer */
};

%token <iValue> INTEGER 

%token CODE SPECIAL OPRTURN OPRSEND OPRON PORT FOR
%type <nPtr> stmt stmt_list oper operation duration pin location
 

 
%%
 
input   : function { exit(0);}
	;

function : function stmt  { ex($2); freeNode($2);}
	|
	;

stmt	: 
/*	  CODE SPECIAL 		{ startCompiler(); }*/
/*	| OPRTURN operation    { $$ = opr(OPRTURN,1,$2); }*/
	| PORT location     	{ $$ = opr(PORT,1,$2); }
/*	| FOR duration 			{}*/

	;

stmt_list : stmt 	{ $$=$1;}
	| /*stmt_list stmt { $$ =opr(' ',2,$1,$2);}*/
	;


/*oper 	: OPRTURN operation { $$ = opr(OPRTURN,1,$2); }
*/

operation : 
           OPRON { $$=cmd("ON");}
/*          | OPRSEND {}*/
          ;

/*	;*/

/*pin	: PORT location { $$ = opr(PORT,1,$2);}*/

location : INTEGER  { $$ = con($1); }
	  
		;


/*duration : INTEGER { $$=con($1); };*/
	  


%%

nodeType *con(int value) {
    nodeType *p;

    /* allocate node */
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeCon;
    p->con.value = value;

    return p;
}

nodeType *id(int i) {
    nodeType *p;

    /* allocate node */
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeId;
    p->id.i = i;

    return p;
}

/*entity name */
/*
nodeType *enm(char *c) {
    nodeType *p;

    /* allocate node */
  /*  
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */ 
    /*
    p->type = typeEName;
    p->ename.en = c;


    return p;
}
*/
/*command name */
nodeType *cmd(char *c) {//nodeType *cmd(char *c) {
    nodeType *p;

    /* allocate node */
    
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */ 
    
    p->type = typeCmd;
    p->cmd.cm = c;
    return p;
}



nodeType *opr(int oper,int nops,...) {
    va_list ap;
    nodeType *p;
    int i;

    /* allocate node, extending op array */
    if ((p = malloc(sizeof(nodeType) )) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeOpr;
    p->opr.oper = oper;
    p->opr.nops = nops;
    va_start(ap, nops);
    for (i = 0; i < nops; i++)
        p->opr.op[i]= va_arg(ap, nodeType*);
    va_end(ap);
    return p;
}

void freeNode(nodeType *p) {
    int i;

    if (!p) return;
    if (p->type == typeOpr) {
        for (i = 0; i < p->opr.nops; i++)
            freeNode(p->opr.op[i]);
    }
    free (p);
}

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
