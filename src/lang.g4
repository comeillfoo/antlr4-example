grammar lang;

program     : 'begin' stat+ 'end' ;
stat        : assign
	    | add
	    | sub
		| mul
		| div
	    | print
	;
assign      : 'let' ID 'be' (ID | NUM) ;
add         : 'add' (NUM | ID) 'to' ID;
sub         : 'sub' (NUM | ID) 'from' ID;
mul         : 'mul' ID 'by' (NUM | ID);
div         : 'div' ID 'by' (NUM | ID);

print       : 'print' (NUM | ID);

ID  :   [a-z]+ ;
NUM :   [0-9]+ ;
WS  :   [ \r\t\n]+ -> skip;


