module LESSON-07-EX2-SYNTAX

imports DOMAINS

  syntax AExp ::= Int 
				> AExp "*" AExp [left, function]
				| AExp "/" AExp [left, function]
				> AExp "+" AExp [left, function]
				| AExp "-" AExp [left, function]	
endmodule

module LESSON-07-EX2
  imports LESSON-07-EX2-SYNTAX

  rule I1 + I2 => I1 +Int I2
  rule I1 - I2 => I1 -Int I2
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 /Int I2 requires I2 =/=Int 0
endmodule