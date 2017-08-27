#include <stdio.h>
#include <string.h>
#include "main.h"
#include "y.tab.h"

char *entityName;   // variable to hold the current entity name
FILE *f;
int port;

int ex(nodeType *p) {


    if (!p) return 0; //return on empty node
    switch(p->type) {

    case typeCmd:

       /*Turn On LED*/

  case typeOpr:
        switch(p->opr.oper) {

        case CODE:
	port = p->con.value;
                f = fopen("test.ino", "a");
                    fprintf(f,"int led = %d",port);
                    fprintf(f,"void setup(){" );
                    fprintf(f,"pinMode(led,OUTPUT);");
                    fprintf(f,"}\n");

                fclose(f);

//            entityName = p->opr.op[0]->ename.en;
            //FILE *f;
  //          f = fopen("test.ino", "a");
    //        fprintf(f,"\tint test%s\n",entityName);
      //      fclose(f);
        //    ex(p->opr.op[1]);
//	    printf("\nsecond arguoemt tested ");
            break;
/*
   case PORT:
            //FILE *f;
            f = fopen("vhdl.vhd", "a");
            fprintf(f,"\n\tPORT ( ");
            inputs = p->opr.op[0]->con.value;
            outputs = p->opr.op[1]->con.value;
            int  totalIO = inputs+outputs, currentIO = 0 ;
            //generate inputs
            for( i=0; i<inputs; i++){
                currentIO++;

                if(currentIO == totalIO) {
                    fprintf(f,"\n\t\tIN%d\t: IN STD_LOGIC );", i );
                } else {
                    fprintf(f,"\n\t\tIN%d\t: IN STD_LOGIC;", i );
                }
            }
            //generate outputs
            for( i=0; i<outputs; i++){
                currentIO++;

                if(currentIO == totalIO) {
                    fprintf(f,"\n\t\tOU%d\t: OUT STD_LOGIC );", i );
                } else {
                    fprintf(f,"\n\t\tOU%d\t: OUT STD_LOGIC;", i );
                }
            }
            fprintf(f,"\n\tEND %s ; \n",entityName);
            fclose(f);
            ex(p->opr.op[0]);
            break;

        case OPRT:
            function = p->opr.op[0]->ename.en;
            f = fopen("vhdl.vhd", "a");
            fprintf(f,"\n\tARCHITECTURE Str OF %s IS \n",entityName );
            fclose(f);
            ex(p->opr.op[0]);
            f = fopen("vhdl.vhd", "a");
            fprintf(f,"\n\tEND Str ;\n" );
            fclose(f);


            break;


        default:
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);
*/
        }
    }
    return 0; 
}

// method to add libraries and packages
void  startCompiler(){
    FILE *f;
    f = fopen("test.ino", "a");
    fclose(f);

}


