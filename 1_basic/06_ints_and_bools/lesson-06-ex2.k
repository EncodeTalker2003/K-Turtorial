requires "lesson-06-c.k"
requires "lesson-06-ex1.k"

module LESSON-06-EX2-SYNTAX
  imports LESSON-06-EX1-SYNTAX
  imports LESSON-06-C-SYNTAX

  syntax Bool ::= AExp "==" AExp [function]
				| AExp "!=" AExp [function]
				| AExp "<" AExp [function]
				| AExp "<=" AExp [function]
				| AExp ">" AExp [function]
				| AExp ">=" AExp [function]
endmodule

module LESSON-06-EX2

  imports LESSON-06-EX2-SYNTAX
  imports LESSON-06-EX1
  imports LESSON-06-C

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