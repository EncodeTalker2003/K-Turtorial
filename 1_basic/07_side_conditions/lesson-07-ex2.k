module LESSON-07-EX2-SYNTAX

  imports INT
  imports BOOL

  syntax Bool ::= AExp "==" AExp [function]
				| AExp "!=" AExp [function]
				| AExp "<" AExp [function]
				| AExp "<=" AExp [function]
				| AExp ">" AExp [function]
				| AExp ">=" AExp [function]

  syntax Bool ::= "(" Bool ")" [bracket]
                > "!" Bool [function]
                > left:
                  Bool "&&" Bool [function]
                | Bool "^" Bool [function]
                | Bool "||" Bool [function]
				| Bool "->" Bool [function]

  syntax AExp ::= Int 
				> AExp "*" AExp [left, function]
				| AExp "/" AExp [left, function]
				> AExp "+" AExp [left, function]
				| AExp "-" AExp [left, function]	
endmodule

module LESSON-07-EX2

  imports LESSON-07-EX2-SYNTAX

  rule ! B => notBool B
  rule A && B => A andBool B
  rule A ^ B => A xorBool B
  rule A || B => A orBool B
  rule A -> B => (notBool A) orBool B

  rule I1 + I2 => I1 +Int I2
  rule I1 - I2 => I1 -Int I2
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 divInt I2 requires I2 =/=Int 0

  rule I1 == I2 => true  requires I1 ==Int I2
  rule I1 == I2 => false requires I1 =/=Int I2
  rule I1 != I2 => true  requires I1 =/=Int I2
  rule I1 != I2 => false requires I1 ==Int I2
  rule I1 < I2  => true  requires I1 <Int I2
  rule I1 < I2  => false requires I1 >=Int I2
  rule I1 <= I2 => true  requires I1 <=Int I2
  rule I1 <= I2 => false requires I1 >Int I2
  rule I1 > I2  => true  requires I1 >Int I2
  rule I1 > I2  => false requires I1 <=Int I2
  rule I1 >= I2 => true  requires I1 >=Int I2
  rule I1 >= I2 => false requires I1 <Int I2
endmodule