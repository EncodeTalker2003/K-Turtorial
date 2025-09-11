module LESSON-03-EX

imports DOMAINS

  syntax AExp ::= Int 
                | "(" AExp ")" [bracket]
				| AExp "+" AExp [function]
				| AExp "*" AExp [function]
				| AExp "-" AExp [function]
				| AExp "/" AExp [function]
				| "-" AExp [function]
endmodule