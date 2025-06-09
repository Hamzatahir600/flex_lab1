%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int validate_password(const char* str) {
    int has_upper = 0, has_lower = 0, has_digit = 0, has_special = 0;
    int len = strlen(str);
    if (len < 8 || len > 15) return 0;
    for (int i = 0; i < len; i++) {
        if (isupper(str[i])) has_upper = 1;
        else if (islower(str[i])) has_lower = 1;
        else if (isdigit(str[i])) has_digit = 1;
        else if (!isalnum(str[i])) has_special = 1;
    }
    return has_upper && has_lower && has_digit && has_special;
}
%}

%%

[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}   { printf("Valid Email: %s\n", yytext); }
[A-Za-z0-9!@#$%^&*()_+=\-{}\[\]:\";'<>?,./]{8,15} {
    if (validate_password(yytext))
        printf("Valid Password: %s\n", yytext);
}

.|\n    ;

%%

int main() {
    yylex();
    return 0;
}