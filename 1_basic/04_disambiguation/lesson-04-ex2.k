module LESSON-04-EX-2

imports DOMAINS

  syntax AExp ::= Int 
                | "(" AExp ")" [bracket]
				> "-" AExp [function]
				> AExp "*" AExp [left, function]
				| AExp "/" AExp [left, function]
				> AExp "+" AExp [left, function]
				| AExp "-" AExp [left, function]	
endmodule