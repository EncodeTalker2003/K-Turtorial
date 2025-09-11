### 1

We could modify `lesson-05-d.k` as follows:

```k
module LESSON-05-D-SYNTAX
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule

module LESSON-05-D-NOT-TRUE
  imports LESSON-05-D-SYNTAX

  rule not true => false
endmodule

module LESSON-05-D-NOT-FALSE
  imports LESSON-05-D-SYNTAX

  rule not false => true
endmodule

module LESSON-05-D
  imports LESSON-05-D-NOT-TRUE
  imports LESSON-05-D-NOT-FALSE
endmodule
```

### 2

When we modify the name of `COLOROF` to any other name, e.g., `COLOR-OF`, the compilation would fail with the following error:

```
[Error] Compiler: Could not find main module with name COLOROF in definition.
Use --main-module to specify one.
```

It indicates that K could not find the main module that named as `COLOROF` by default. We could specify the main module in the command line as follows:

```
kompile colorOf.k --main-module 'COLOR-OF'
```

### 3

#### (1)

The answer is in file `lesson-05-ex1.k`.

```k
module INT-BRACKET
  imports DOMAINS
  syntax AExp ::= Int [group(literal)]
				| "(" AExp ")" [bracket, group(bracket)]
endmodule

module ADD-SUB-UNARY
  syntax AExp ::= "-" AExp [function, group(unary)]
				> AExp "+" AExp [left, function, group(addsub)]
				| AExp "-" AExp [left, function, group(addsub)]
endmodule

module MUL-DIV
  syntax AExp ::= AExp "*" AExp [left, function, group(muldiv)]
				| AExp "/" AExp [left, function, group(muldiv)]
endmodule

module LESSON-05-EX1
  imports INT-BRACKET
  imports ADD-SUB-UNARY
  imports MUL-DIV

  syntax priority literal bracket > unary > muldiv > addsub
endmodule
```

#### (2)

The answer is in the directory `/lesson-05-ex2`, which contains two files.

`lesson-05-ex2-syntax.k`:

```k
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
```

`lesson-05-ex2.k`:

```k
requires "lesson-05-ex2-syntax.k"

module LESSON-05-EX2

  imports LESSON-05-EX2-SYNTAX

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Kiwi()) => Green()
  rule colorOf(Blackberry()) => Black()
endmodule
```

#### (3)

When we reorganize the file structure as following:

```
lesson-05-ex2/
├── lesson-05-ex2-syntax
│   └── lesson-05-ex2-syntax.k
└── lesson-05-ex2.k
```

There is a compilation error:

```

[Error] Critical: Could not find file: lesson-05-ex2-syntax.k
Lookup
directories:[/nix/store/j7nj3xg29l69knnw3kr2vknvn4bjqzqz-k-7.1.284-170a601171f2776b77520817bb0268e203c05a9b/lib/kframework/java/../../../include/kframework/builtin,
./lesson-05-ex2]
	Source(/Users/zrzhou/Desktop/K-framwork/K-Turtorial/1_basic/05_modules/lesson-05-ex2/lesson-05-ex2.k)
	Location(1,1,1,34)
	1 |	requires "lesson-05-ex2-syntax.k"
	  .	^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

```

This is because the compiler would only search the file in the current working directory and the builtin directory by default. We could specify the include directory as follows:

```
kompile lesson-05-ex2/lesson-05-ex2.k -I ./lesson-05-ex2/lesson-05-ex2-syntax
```