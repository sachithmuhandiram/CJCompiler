%{
    #include "main.h"
    #include <stdio.h>
    #include <stdarg.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(char *);
    char *name[10];
    
/* prototypes */
nodeType *enm(char* c);
nodeType *opr(int oper, int nops, ...);
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
%token CODE PORT FOR TURN SEND OPRT INTEGER OPT ASSIG TIME SPCL
%type <nPtr> stmt stmt_list operation opr duration location pin
%%
 
input   : statement	{ exit(0); }
	;

statement :statement stmt { ex($2); freeNode($2);}
	| 
	;

stmt	: CODE SPCL 			{ startCompiler(); }
	| operation stmt_list 	{ }
	| opr pin stmt_list
	| location stmt_list 	{ $$ = opr(PORT,1,$2); }
	| duration 			{}
	;

stmt_list : stmt 
	| stmt_list stmt
	;

operation : TURN { printf("turn was taken");}
	  | SEND {}
	  ;

opr 	: OPRT { printf(" on was taken ");}

	;

pin	: PORT { $$ = opr(PORT,1,$2);}

location : INTEGER { $$ = con($1);}

duration : FOR { $$ = opr(PORT,1,$2); }
	  


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
nodeType *enm(char *c) {
    nodeType *p;

    /* allocate node */
    
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */ 
    
    p->type = typeEName;
    p->ename.en = c;


    return p;
}

/*command name */
nodeType *cmd(char *c) {
    nodeType *p;

    /* allocate node */
    
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */ 
    
    p->type = typeCmd;
    p->cmd.cm = c;


    return p;
}



nodeType *opr(int oper, int nops, ...) {
    va_list ap;
    nodeType *p;
    int i;

    /* allocate node, extending op array */
    if ((p = malloc(sizeof(nodeType) + (nops-1) * sizeof(nodeType *))) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeOpr;
    p->opr.oper = oper;
    p->opr.nops = nops;
    va_start(ap, nops);
    for (i = 0; i < nops; i++)
        p->opr.op[i] = va_arg(ap, nodeType*);
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
