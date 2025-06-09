%{
#include <stdio.h>
%}

%%

"int"       { printf("Integer Type: %s\n", yytext); }
"float"     { printf("Float Type: %s\n", yytext); }
"bool"      { printf("Boolean Type: %s\n", yytext); }
"string"    { printf("String Type: %s\n", yytext); }

"+"|"-"|"*"|"/"         { printf("Arithmetic Operator: %s\n", yytext); }
"<="|">="|"="|"<"|">"   { printf("Relational Operator: %s\n", yytext); }

"(" { printf("Round Bracket Open: %s\n", yytext); }
")" { printf("Round Bracket Close: %s\n", yytext); }
"[" { printf("Square Bracket Open: %s\n", yytext); }
"]" { printf("Square Bracket Close: %s\n", yytext); }
"{" { printf("Curly Bracket Open: %s\n", yytext); }
"}" { printf("Curly Bracket Close: %s\n", yytext); }

";" { printf("Semicolon: %s\n", yytext); }

.   { printf("Other Character: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}