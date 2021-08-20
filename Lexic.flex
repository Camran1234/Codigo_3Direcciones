package camran.codigo_3direcciones_ejemplo.parser;
import java_cup.runtime.*;
import static camran.codigo_3direcciones_ejemplo.parser.sym.*;
%%
%class Lexic
%cup
%unicode
%line
%column
%public


/* Regular Expressions */
    LineTerminator = \r|\n|\r\n
    WhiteSpace     = {LineTerminator} | [ \t\f]
    Numbers = [0-9]+
    Id = [aA-zZ][aA-zZ|0-9|"$"|"_"]*

%%

<YYINITIAL>  {

    {Numbers}    {
           
            return new Symbol(NUMERO, yyline + 1, yycolumn +1, yytext());
                    }
     {Id}        {
           
            return new Symbol(SIMBOLO, yyline+1, yycolumn+1, yytext());
                    }

    "+" {return new Symbol(SUMA, yyline+1, yycolumn+1, yytext());}
    "-" {return new Symbol(RESTA, yyline+1, yycolumn+1, yytext());}
    "*" {return new Symbol(MULT, yyline+1, yycolumn+1, yytext());}
    "/" {return new Symbol(DIV, yyline+1, yycolumn+1, yytext());}
    ";" {return new Symbol(COLON, yyline+1, yycolumn+1, yytext());}
    "(" {return new Symbol(OPEN_PARENTHESIS, yyline+1, yycolumn+1, yytext());}
    ")" {return new Symbol(CLOSE_PARENTHESIS, yyline+1, yycolumn+1, yytext());}
    "=" {return new Symbol(EQUAL, yyline+1, yycolumn+1, yytext());}

    {WhiteSpace} {/*empty*/}
}


[^] {System.out.println("Error en el lexema se encontro: "+yytext());}