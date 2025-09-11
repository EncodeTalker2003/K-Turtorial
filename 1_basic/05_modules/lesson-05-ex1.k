module INT-BRACKET
  imports DOMAINS
  syntax AExp ::= Int [group(literal)]
				| "(" AExp ")" [bracket, group(bracket)]
endmodule

module ADD-SUB-UNARY
  syntax AExp ::= "-" AExp [function, group(unary)]
				> AExp "+" AExp [left, function, group(addsub)]
				| AExp "-" AExp [left, function, group(addsub)]
endmodule

module MUL-DIV
  syntax AExp ::= AExp "*" AExp [left, function, group(muldiv)]
				| AExp "/" AExp [left, function, group(muldiv)]
endmodule

module LESSON-05-EX1
  imports INT-BRACKET
  imports ADD-SUB-UNARY
  imports MUL-DIV

  syntax priority literal bracket > unary > muldiv > addsub
endmodule
