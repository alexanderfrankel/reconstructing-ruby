%{
	#include <stdio.h>
	#include "parse.tab.h"

	#define VTYPE(type, value) printf("%s(%s)\n", type, value)
	#define TYPE(type) printf("%s\n", type)
%}

%option noyywrap

NUMBER [0-9](_[0-9]|[0-9])*

%%

#.*$ {}

[a-z_][a-zA-Z0-9_]* { VTYPE("ID", yytext); }

{NUMBER}(\.{NUMBER}|(\.{NUMBER})?[eE][+-]?{NUMBER}) { VTYPE("FLOAT", yytext); }

{NUMBER} { yylval = atoi(yytext); return tNUMBER; }

\"([^"]|\\.)*\" { VTYPE("STRING", yytext); }
\'([^']|\\.)*\' { VTYPE("STRING", yytext); }

[A-Z][a-zA-Z0-9_]* { VTYPE("CONSTANT", yytext); }

"=" { TYPE("EQUAL"); }
">" { TYPE("GT"); }
"<" { TYPE("LT"); }
">=" { TYPE("GTE"); }
"<=" { TYPE("LTE"); }
"!=" { TYPE("NEQUAL"); }
"+" { return tPLUS; }
"-" { TYPE("MINUS"); }
"*" { TYPE("MULT"); }
"/" { TYPE("DIV"); }
"%" { TYPE("MOD"); }
"!" { TYPE("EMARK"); }
"?" { TYPE("QMARK"); }
"&" { TYPE("AND"); }
"|" { TYPE("OR"); }
"[" { TYPE("LSBRACE"); }
"]" { TYPE("RSBRACE"); }
"(" { TYPE("LPAREN"); }
")" { TYPE("RPAREN"); }
"{" { TYPE("LBRACE"); }
"}" { TYPE("RBRACE"); }
"@" { TYPE("AT"); }
"." { TYPE("DOT"); }
"," { TYPE("COMMA"); }
":" { TYPE("COLON"); }

[\t ] {}

\n {}

. { fprintf(stderr, "Unknown token '%s'\n", yytext); }

%%