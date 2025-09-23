module LESSON-16-B-SYNTAX
  imports INT-SYNTAX
  imports ID-SYNTAX
  imports STRING-SYNTAX

  syntax Exp ::= Id "(" ")" | Int | String
  syntax Stmt ::= "return" Exp ";" [strict]
                | "return" "List" "(" ")" ";"
  syntax Decl ::= "fun" Id "(" ")" "{" Stmt "}"
  syntax Pgm ::= List{Decl,""}
  
  syntax Id ::= "main" [token]
endmodule

module LESSON-16-B
  imports LESSON-16-B-SYNTAX
  imports BOOL
  imports LIST
  imports STRING
  imports ID

  configuration <T>
                  <k> $PGM:Pgm ~> main () </k>
                  <functions> .Map </functions>
                  <fstack> .List </fstack>
                </T>

  // declaration sequence
  rule <k> D:Decl P:Pgm => D ~> P ...</k>
  rule <k> .Pgm => . ...</k>

  // function definitions
  rule <k> fun X:Id () { S } => . ...</k>
       <functions>... .Map => X |-> S ...</functions>

  // function call
  syntax KItem ::= stackFrame(K, Id)
  rule <k> X:Id () ~> K => S </k>
       <functions>... X |-> S ...</functions>
       <fstack> .List => ListItem(stackFrame(K, X)) ...</fstack>

  // return statement
  rule <k> return I:Int ; ~> _ => I ~> K </k>
       <fstack> ListItem(stackFrame(K, _X)) => .List ...</fstack>
  rule <k> return S:String ; ~> _ => S ~> K </k>
	   <fstack> ListItem(stackFrame(K, _X)) => .List ...</fstack>

  rule <k> return List ( ) ; ~> _ => printStackTrace(ListItem(stackFrame(K, X)) L:List) ~> K </k>
	   <fstack> ListItem(stackFrame(K, X)) L:List => L </fstack>

  syntax Bool ::= isKResult(K) [function, symbol(isKResult)]
  rule isKResult(_:Int) => true
  rule isKResult(_:String) => true
  rule isKResult(_) => false [owise]

  syntax String ::= printStackTrace(List) [function]
  rule printStackTrace(.List) => "" 
  rule printStackTrace(ListItem(stackFrame(_, X:Id)) L:List) => Id2String(X) +String "() " +String printStackTrace(L) 
endmodule