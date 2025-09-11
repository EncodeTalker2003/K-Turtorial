module LESSON-02-D

  syntax Color ::= Yellow()
                 | Blue()
                 | Green()
				 | Black()
                 | colorOf(Fruit) [function]
  syntax Fruit ::= Banana()
                 | Blueberry()
				 | Kiwi()
				 | Blackberry()
				 

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Kiwi()) => Green()
  rule colorOf(Blackberry()) => Black()

endmodule