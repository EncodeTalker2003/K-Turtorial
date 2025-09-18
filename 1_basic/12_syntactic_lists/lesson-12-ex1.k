module LESSON-12-EX1
	imports STRING

	syntax Strings ::= NeList{String, ","}
	syntax String ::= cat(Strings) [function]

	rule cat(S:String) => S
	rule cat(S1:String, S2:String, SS:Strings) => cat(S1 +String S2, SS)
endmodule