module LESSON-18-EX1
	imports INT
	imports K-EQUAL

	syntax Int ::= testEqual(KItem, KItem) [function]

	rule testEqual(K1:KItem, K2:KItem) => #if (K1 ==K K2) #then 0 #else 1 #fi
endmodule