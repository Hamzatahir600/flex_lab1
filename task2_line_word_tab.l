%{
#include <stdio.h>
int lines = 0, tabs = 0, words = 0;
%}

%%

\n          { lines++; }
\t          { tabs++; }
[A-Za-z0-9]+ { words++; }

.           ;

%%

int main() {
    yylex();
    printf("Lines: %d\n", lines);
    printf("Tabs: %d\n", tabs);
    printf("Words: %d\n", words);
    return 0;
}