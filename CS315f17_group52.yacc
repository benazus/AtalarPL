%token INTEGER DOUBLE TRUTH START STOP IF ELSE TBEGIN TEND WHILE RETURN ALPHANUMERIC CAPITAL_ALPHANUMERIC SEQU SAND SOR SDIF IMPLY EQUIVALENCE COMMENT_START COMMENT_END LB RB LSB RSB LCB RCB EXCLAMATION COMMA DEF_START DEF_STOP READ WRITE GO FINISH SPACE

%%
program: start { printf("Valid input\n"); return 0;};

start: START predicates STOP GO statements FINISH | GO statements FINISH;

predicates: predicate predicates | predicate;

predicate: name LB parameter_list RB predicate_body;

name: ALPHANUMERIC;

parameter_list: parameter | parameter COMMA parameter_list;

parameter: var | TRUTH | const | list_access;

var: CAPITAL_ALPHANUMERIC;

const: number | ALPHANUMERIC;

number: INTEGER	| DOUBLE;

list_access: var LSB INTEGER RSB;

predicate_body: DEF_START statements RETURN returndis DEF_STOP;

statements: statement statements | statement;

statement: comment_body | yebunu | okuyazbunu | assignment;

comment_body: COMMENT_START comments COMMENT_END;

comments: comment comments | ;

comment: ALPHANUMERIC | CAPITAL_ALPHANUMERIC;

yebunu: if | loop;

if: IF LB prop RB TBEGIN statements TEND ELSE TBEGIN statements TEND;

prop: prop esitlebakam poperand | poperand;

esitlebakam: IMPLY | EQUIVALENCE;

poperand: poperand andor toterand | toterand;

toterand: toterand SDIF kokerand | kokerand;

kokerand: EXCLAMATION kokerand | term;

term: LB prop RB | parameter;

andor: SAND | SOR;

loop: WHILE LB prop RB TBEGIN statements TEND;

okuyazbunu: read | write;

read: READ LB var RB;

write: WRITE LB yazbunu RB;

yazbunu: prop | predicate_inst;

predicate_inst: name LB parameter_list RB;

assignment: var SEQU kullanbunu;

kullanbunu: prop | predicate_inst | list;

list: LCB values RCB;

values: tutbunu COMMA values | tutbunu;

tutbunu: TRUTH | const;

returndis: prop | predicate_inst;

%%

#include "lex.yy.c"

int yyerror(char* s){
    fprintf(stderr, "%s at line %d\n",s, yylineno);
    return 1;
}

int main(){
    yyparse();
    return 0;
}

