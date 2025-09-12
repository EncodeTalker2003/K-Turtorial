module LESSON-07-EX1
  imports INT
  imports BOOL

  syntax Bool ::= isEven(Int) [function]

  rule isEven(I) => true  requires I modInt 2 ==Int 0

  rule isEven(_) => false [owise]
endmodule