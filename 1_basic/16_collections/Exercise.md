### 1

The answer is in `lesson-16-a.k`.

For the syntax part, we add the definition for `Stmt`

```k
module LESSON-16-A-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX

  syntax Exp ::= Id | Int
  syntax Decl ::= "int" Id "=" Exp ";" [strict(2)]
  syntax Stmt ::= Decl
				| Id "=" Exp ";" [strict(2)]
  syntax Pgm ::= List{Stmt,""}
endmodule
```

For the semantics part, we add the rules for the new assignment statement

```k
...
rule <k> X:Id = I:Int ; => . ...</k>
       <state> STATE => STATE[ X <- I ] </state>
...
```

### 2

The answer is in `lesson-16-b.k`.

For the syntax part, we add term `return List();` to `Stmt` so that it would return the string of the current stack trace.

For the semantics part, first we define the `printStackTrace(List)` function to convert the list of stack frames to a string. 

```k
syntax String ::= printStackTrace(List) [function]
  rule printStackTrace(.List) => "" 
  rule printStackTrace(ListItem(stackFrame(_, X:Id)) L:List) => Id2String(X) +String "() " +String printStackTrace(L) 
```

Next, we add new rules for the `return` statement and the `stackFrame` constructor.

```k
syntax KItem ::= stackFrame(K, Id)

rule <k> return S:String ; ~> _ => S ~> K </k>
	 <fstack> ListItem(stackFrame(K, _X)) => .List ...</fstack>

rule <k> return List ( ) ; ~> _ => printStackTrace(ListItem(stackFrame(K, X)) L:List) ~> K </k>
	 <fstack> ListItem(stackFrame(K, X)) L:List => L </fstack>
```

### 3

The answer is in `lesson-16-ex.k`.