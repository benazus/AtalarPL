%option yylineno



%%

[+|-]?[0-9]+ return(INTEGER);
[+|-]?[0-9]+(\.[0-9]+)? return(DOUBLE);
(true)|(false) return(TRUTH);

start return(START);
stop return(STOP);
if return(IF);
else return(ELSE);
begin return(TBEGIN);
end return(TEND);
while return(WHILE);
return return(RETURN);
read return(READ);
write return(WRITE);
go return(GO);
finish return(FINISH);

[a-z][a-zA-Z0-9]* return(ALPHANUMERIC);
[A-Z][a-zA-Z0-9]* return(CAPITAL_ALPHANUMERIC);

\= return(SEQU);
\& return(SAND);
\| return(SOR);
\\ return(SDIF);
\-\> return(IMPLY);
\<\-\> return(EQUIVALENCE);

(\#\%) return(COMMENT_START);
(\%\#) return(COMMENT_END);

\( return(LB);
\) return(RB);
\[ return(LSB);
\] return(RSB);
\{ return(LCB);
\} return(RCB);
\! return(EXCLAMATION);
\, return(COMMA);

(\:\:) return(DEF_START);
(\;\;) return(DEF_STOP);

[ \t\n] ;
%%

int yywrap(){
    return 1;
}
