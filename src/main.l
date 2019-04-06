
%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"

%}

%%



"["  {return BA;}
"]" {return BE;}
[,] {return COMA;}
[0-9]+[.]?[0-9]+ {return NUM;}

["][a-zA-Z0-9]+[]?[a-zA-Z0-9]+[]?["] {return SSTRING;}

[{] {return CA;}

[}] {return CF;}

[:] {return COLON;}

(null) {return NUL;}

[ ] ;
\n ;
. ;

%%

int yywrap() {
  return 1;
}

