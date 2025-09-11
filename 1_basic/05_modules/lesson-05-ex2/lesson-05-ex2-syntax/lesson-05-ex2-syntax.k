module LESSON-05-EX2-SYNTAX

  syntax Color ::= Yellow()
                 | Blue()
                 | Green()
				 | Black()
                 | colorOf(Fruit) [function]
  syntax Fruit ::= Banana()
                 | Blueberry()
				 | Kiwi()
				 | Blackberry()
				 
endmodule