#include <stdio.h>

int main(){
   int result = yyparse();
	
	if(result){
	        printf("Compilerd");
	}else{
		printf("Error");
	}

}

