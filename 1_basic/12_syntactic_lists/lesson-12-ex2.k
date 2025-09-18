module LESSON-12-EX2
	imports INT

	syntax Ints ::= NeList{Int, ","}

	syntax Int ::= sum(Ints) [function]
				 | sum() [function]

	rule sum() => 0
	rule sum(I1:Int, I2:Int, IS:Ints) => sum(I1 +Int I2, IS)
	rule sum(I:Int) => I
endmodule