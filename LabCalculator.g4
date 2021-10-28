grammar LabCalculator;

/*
 * Parser Rules
 */


compileUnit:expression EOF;

expression :
 LPAREN expression RPAREN #ParenthesizedExpr
 | expression EXPONENT expression #ExponentialExpr
    | expression operatorToken=(MULTIPLY | DIVIDE) expression #MultiplicativeExpr
 | expression operatorToken=(ADD | SUBTRACT) expression #AdditiveExpr
 | MAX LPAREN expression COMMA expression RPAREN #MaxExp
 | MIN LPAREN expression COMMA expression RPAREN #MinExp
 | expression MOD expression #ModExp
 | expression DIV expression #DivExp
 | NUMBER #NumberExpr
 | IDENTIFIER #IdentifierExpr
 ; 

 /*
 * Lexer Rules
 */


 NUMBER : INT ('.' INT)?; 
 IDENTIFIER : [a-zA-Z]+[1-9][0-9]+;

 INT : ('0'..'9')+;

 EXPONENT : '^';
 MULTIPLY : '*';
 DIVIDE : '/';
 SUBTRACT : '-';
 ADD : '+';
 LPAREN : '(';
 RPAREN : ')';
 COMMA : ',';
 MAX : 'max';
 MIN : 'min';
 MOD : 'mod';
 DIV : 'div';


WS : [ \t\r\n] -> channel(HIDDEN);