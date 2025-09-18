module LESSON-06-EX1-SYNTAX

imports DOMAINS

  syntax AExp ::= Int 
				> AExp "*" AExp [left, function]
				| AExp "/" AExp [left, function]
				> AExp "+" AExp [left, function]
				| AExp "-" AExp [left, function]	
endmodule

module LESSON-06-EX1
  imports LESSON-06-EX1-SYNTAX

  rule I1 + I2 => I1 +Int I2
  rule I1 - I2 => I1 -Int I2
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 divInt I2
endmodule