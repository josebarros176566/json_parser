%{
#include <stdio.h>
void yyerror(char *c);
int yylex(void);
int a;
%}

%token NUM SSTRING CA CF COLON NUL COMA BA BE ES

%%

FINAL:
	CA PROGRAMA CF

PROGRAMA:
		CA PROGRAMA CF
          |  SSTRING COLON SSTRING 
          | SSTRING COLON NUM 
       	 | SSTRING COLON NUL 
         |SSTRING COLON   ARRAYS   
         |SSTRING COLON    BA ARRAYS BE   
         | SSTRING COLON PROGRAMA 
        ;

ARRAYS:
		
	ARRAYS COMA ARRAYS
	| BA ARRAYS BE
	| BA BE
	|SSTRING COMA SSTRING
	|SSTRING COMA NUM
	|SSTRING COMA PROGRAMA
	|SSTRING COMA ARRAYS	
	|NUM COMA NUM
	|NUM COMA SSTRING
	|NUM COMA PROGRAMA
	|NUM COMA ARRAYS
	|PROGRAMA COMA SSTRING
	|PROGRAMA COMA NUM
	|PROGRAMA COMA PROGRAMA
	|PROGRAMA COMA ARRAYS
	|ARRAYS COMA SSTRING
	|ARRAYS COMA NUM
	|ARRAYS COMA PROGRAMA
	| CA PROGRAMA COMA PROGRAMA CF
	;



%%

void yyerror(char *s) {
    //fprintf(stderr,"%s\n",s);
     printf("INVALIDO\n");
     a=0;
}

int main() {

  a=1;
  yyparse();
  if(a==1)
  printf("VALIDO\n");

  return 0;

}
