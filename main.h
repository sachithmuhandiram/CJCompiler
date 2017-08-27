typedef enum { typeCon, typeId, typeEName, typeCmd, typeOpr } nodeEnum;

/* constants */
typedef struct {
    int value;                  /* value of constant */
} conNodeType;

/* identifiers */
typedef struct {
    int i;                      /* subscript to sym array */
} idNodeType;

/* string */
typedef struct {
    char *en;                      /* Entity name */
} eNameNodeType;
/*commands*/
typedef struct {
    char *cm;                      /* command name */
} cmdNodeType;

/* operators */
typedef struct {
    int oper;                   /* operator */
    int nops;                   /* number of operands */
    struct nodeTypeTag *op[1];  /* operands, extended at runtime */
} oprNodeType;

typedef struct nodeTypeTag {
    nodeEnum type;              /* type of node */

    union {
        conNodeType con;        /* constants */
        idNodeType id;          /* identifiers */
        cmdNodeType cmd;        /*command name */
        eNameNodeType ename;    /* Entity Name */
        oprNodeType opr;        /* operators */
    };
} nodeType;
