module LESSON-05-D-SYNTAX
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule

module LESSON-05-D-NOT-TRUE
  imports LESSON-05-D-SYNTAX

  rule not true => false
endmodule

module LESSON-05-D-NOT-FALSE
  imports LESSON-05-D-SYNTAX

  rule not false => true
endmodule

module LESSON-05-D
  imports LESSON-05-D-NOT-TRUE
  imports LESSON-05-D-NOT-FALSE
endmodule