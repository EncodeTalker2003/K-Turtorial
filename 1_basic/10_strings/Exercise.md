### 1

The answer is in file `lesson-10-ex.k`. The main logic of solving this problem is as follows:

- Find the first word in the string and add it to the result.
- Remove the first sentence from the string, and repeat the process until there are no more sentences left.

We define the following functions for finding the first appearance of some specific character in a string.

```k
syntax Int ::= findFirstDot(String, Int) [function]
			 | findFirstChar(String, Int) [function]
			 | findFirstDotSpace(String, Int) [function]

rule findFirstDot(S, I) => findString(S, ".", I)
rule findFirstChar(S, I) => findChar(S, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", I)
rule findFirstDotSpace(S, I) => findChar(S, ". ", I)

```k

We then define the following functions.

```k
syntax String ::= findFirstWord(String) [function]
				| removeFirstSentence(String) [function]
				| calc(String) [function]
				| calcOther(String) [function]
```

The function `findFirstWord(String)` would return the first word in the string. We would call this function only when such a word exists.

```k
rule findFirstWord(S) => substrString(S, findFirstChar(S, 0), findFirstSpace(S, findFirstChar(S, 0)))
```

The function `removeFirstSentence(String)` would remove the first sentence in the string. Also, we would call this function only when such a sentence exists.

```k
rule removeFirstSentence(S) => substrString(S, findFirstDot(S, 0) +Int 1, lengthString(S))
```

The main function we call is `calc(String)`, the function `calcOther(String)` has similar logic with it but would add a space in front of the word obtained by `findFirstWord(String)` it gets since we are producing a sentence.

```k
rule calc(S) => findFirstWord(S) +String calcOther(removeFirstSentence(S)) requires findFirstDot(S, 0) >=Int 0
	rule calc(S) => "" requires findFirstDot(S, 0) <Int 0

rule calcOther(S) => "." requires findFirstDot(S, 0) <Int 0
	rule calcOther(S) => " " +String findFirstWord(S) +String calcOther(removeFirstSentence(S)) requires findFirstDot(S, 0) >=Int 0
```
