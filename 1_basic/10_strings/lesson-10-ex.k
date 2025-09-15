module LESSON-10-EX

	imports STRING
	imports INT

	syntax String ::= findFirstWord(String) [function]
	                | removeFirstSentence(String) [function]
					| calc(String) [function]
					| calcOther(String) [function]

	syntax Int ::= findFirstDot(String, Int) [function]
	             | findFirstChar(String, Int) [function]
				 | findFirstDotSpace(String, Int) [function]
			

	rule findFirstDot(S, I) => findString(S, ".", I)
	rule findFirstChar(S, I) => findChar(S, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", I)
	rule findFirstDotSpace(S, I) => findChar(S, ". ", I)

	rule calc(S) => findFirstWord(S) +String calcOther(removeFirstSentence(S)) requires findFirstDot(S, 0) >=Int 0
	rule calc(S) => "" requires findFirstDot(S, 0) <Int 0

	rule findFirstWord(S) => substrString(S, findFirstChar(S, 0), findFirstSpace(S, findFirstChar(S, 0)))

	rule calcOther(S) => "." requires findFirstDot(S, 0) <Int 0
	rule calcOther(S) => " " +String findFirstWord(S) +String calcOther(removeFirstSentence(S)) requires findFirstDot(S, 0) >=Int 0

	rule removeFirstSentence(S) => substrString(S, findFirstDot(S, 0) +Int 1, lengthString(S))


endmodule