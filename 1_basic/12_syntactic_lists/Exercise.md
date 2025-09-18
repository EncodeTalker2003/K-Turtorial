### 1

The answer is in the file `lesson-12-ex1.k` in this directory.

```k
module LESSON-12-EX1
	imports STRING

	syntax Strings ::= List{String, ","}
	syntax String ::= cat(Strings) [function]

	rule cat(S:String) => S
	rule cat(S1:String, S2:String, SS:Strings) => cat(S1 +String S2, SS)
endmodule
```


### 2

#### (1)

Modify the definition of `Strings` to use `NeList` instead of `List`.

#### (2)

The answer is in the file `lesson-12-ex1.k` in this directory. We need a special case for an empty list.

```k
module LESSON-12-EX2
	imports INT

	syntax Ints ::= NeList{Int, ","}

	syntax Int ::= sum(Ints) [function]
				 | sum() [function]

	rule sum() => 0
	rule sum(I1:Int, I2:Int, IS:Ints) => sum(I1 +Int I2, IS)
	rule sum(I:Int) => I
endmodule
```	