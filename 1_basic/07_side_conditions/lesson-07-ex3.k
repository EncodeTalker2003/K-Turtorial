requires "lesson-07-ex2.k"

module LESSON-07-EX3-SYNTAX
  imports LESSON-07-EX2-SYNTAX
  imports BOOL

  syntax Bool ::= AExp "<=" AExp [function]
				| AExp ">=" AExp [function]
				| AExp "<" AExp [function]
				| AExp ">" AExp [function]
				| AExp "==" AExp [function]
				| AExp "!=" AExp [function]
endmodule

module LESSON-07-EX3
  imports LESSON-07-EX3-SYNTAX
  imports LESSON-07-EX2
  imports BOOL
  imports INT

  rule A1 < A2  => true  requires A1 -Int A2 <Int 0 [owise]
  rule A1 < A2  => false requires A1 -Int A2 >=Int 0 [owise]

  rule A1 <= A2 => true  requires A1 -Int A2 <=Int 0 [owise]
  rule A1 <= A2 => false requires A1 -Int A2 >Int 0 [owise]

  rule A1 > A2  => true  requires A1 -Int A2 >Int 0 [owise]
  rule A1 > A2  => false requires A1 -Int A2 <=Int 0 [owise]

  rule A1 >= A2 => true  requires A1 -Int A2 >=Int 0 [owise]
  rule A1 >= A2 => false requires A1 -Int A2 <Int 0 [owise]

  rule A1 == A2 => true  requires A1 -Int A2 ==Int 0 [owise]
  rule A1 == A2 => false requires A1 -Int A2 =/=Int 0 [owise]
endmodule