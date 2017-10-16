#include <stdio.h>
#include <string.h>
#include "main.h"
#include "y.tab.h"

char *entityName;   // variable to hold the current entity name
FILE *f;
int port;
int inputs;
int outputs;
int ex(nodeType *p) {


    if (!p) return 0; //return on empty node
    switch(p->type) {
/*printf("before command case");
    case typeCmd:
	printf("comand was takes");	
	if (strcmp(p->cmd.cm, "ON")==0) {
		printf("Hurray, I m ready to write turn");
//		f = fopen("test.ino", "a");
		//int i, currentIN = 0;
//		fprintf(f,"\t\tOU%d <= ");
				
//		fclose(f);
}
break;
       /*Turn On LED*/


  case typeOpr:
        switch(p->opr.oper) {

        case OPRTURN:
//	operation =p->opr.op[0]->con.value; 
                f = fopen("test.ino", "a");
		port = p->opr.op[0]->con.value;
                   fprintf(f,"int led = %d\n",port);
        //           fprintf(f,"\nvoid setup(){" );
        //           fprintf(f,"\npinMode(led,OUTPUT);");
          //         fprintf(f,"\n}\n");
		printf("turn operation was taken");
                fclose(f);

//            entityName = p->opr.op[0]->ename.en;
            //FILE *f;
  //          f = fopen("test.ino", "a");
    //        fprintf(f,"\tint test%s\n",entityName);
      //      fclose(f);
//            ex(p->opr.op[1]);
//	    printf("\nsecond arguoemt tested ");
            break;

   case PORT:
//            FILE *f;
            f = fopen("test.ino", "a");
printf("port taken");
  //          fprintf(f,"\n\tPORT ( ");
            port = p->opr.op[0]->con.value;
            //outputs = p->opr.op[1]->con.value;
        //    int  totalIO = inputs+outputs, currentIO = 0 ;
          //  //generate inputs
           // for( i=0; i<inputs; i++){
            //    currentIO++;
printf("port taken, %d",port);

              //  if(currentIO == totalIO) {
                    fprintf(f,"\n\t\tint LED=%d;", port );
		    fprintf(f,"\n\t\tint LED=%d;", outputs );
                //} //else {
                  //  fprintf(f,"\n\t\tIN%d\t: IN STD_LOGIC;", i );
               // }
           // }
            //generate outputs
           // for( i=0; i<outputs; i++){
             //   currentIO++;

               // if(currentIO == totalIO) {
                 //   fprintf(f,"\n\t\tOU%d\t: OUT STD_LOGIC );", i );
                //} else {
                  //  fprintf(f,"\n\t\tOU%d\t: OUT STD_LOGIC;", i );
               // }
           // }
            //fprintf(f,"\n\tEND %s ; \n",entityName);
            fclose(f);
            ex(p->opr.op[0]);
            break;

  //      case OPRT:
//            function = p->opr.op[0]->ename.en;
  //          f = fopen("vhdl.vhd", "a");
    //        fprintf(f,"\n\tARCHITECTURE Str OF %s IS \n",entityName );
      //      fclose(f);
        //    ex(p->opr.op[0]);
          //  f = fopen("vhdl.vhd", "a");
           // fprintf(f,"\n\tEND Str ;\n" );
           // fclose(f);


//            break;


        default:
            ex(p->opr.op[0]);
            ex(p->opr.op[1]);

        }
    }
    return 0; 
}

// method to add libraries and packages
void  startCompiler(){
    FILE *f;
    f = fopen("test.ino", "a");
 fclose(f);
printf("compiler started");

}


