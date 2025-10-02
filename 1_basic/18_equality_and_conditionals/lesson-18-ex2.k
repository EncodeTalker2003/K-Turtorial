module LESSON-18-EX2-SYNTAX

	imports INT-SYNTAX
	imports BOOL-SYNTAX
	imports ID-SYNTAX

  	syntax Exp ::= Int | Bool | Id | Id "(" ")"
                | "(" Exp ")" [bracket]
				> left:
				  Exp "*" Exp [seqstrict]
				| Exp "/" Exp [seqstrict]
				> left:
				  Exp "+" Exp [seqstrict]
				| Exp "-" Exp [seqstrict]
				> left: 
				  Exp "==" Exp [seqstrict]
				| Exp "!=" Exp [seqstrict]
				| Exp "<" Exp [seqstrict]
				| Exp "<=" Exp [seqstrict]
				| Exp ">" Exp [seqstrict]
				| Exp ">=" Exp [seqstrict]
				> "!" Exp [seqstrict]
				> left:
                  Exp "&&" Exp [strict(1)]
                | Exp "^" Exp [seqstrict]
                | Exp "||" Exp [strict(1)]

	syntax Stmt ::= Id "=" Exp ";" [strict(2)]
				  | "int" Id "=" Exp ";" [strict(2)]
				  | "return" Exp ";" [strict]
				  | "if" "(" Exp ")" Block "else" Block [strict(1)]
				  | Block
				  > Stmt Stmt [left]
	syntax Block ::= "{" "}"
				   | "{" Stmt "}"
	syntax Decl ::= "fun" Id "(" ")" Block
	syntax Pgm ::= List{Decl,""}
	
	syntax Id ::= "main" [token]

endmodule

module LESSON-18-EX2
  	imports LESSON-18-EX2-SYNTAX
  	imports INT
	imports BOOL
	imports ID
	imports MAP
	imports LIST

	configuration <T>
					<k> $PGM:Pgm ~> main () </k>
					<state> .Map </state>
					<functions> .Map </functions>
                  	<fstack> .List </fstack>
				  </T>

  
	rule I1 + I2 => I1 +Int I2 
	rule I1 - I2 => I1 -Int I2 
	rule I1 * I2 => I1 *Int I2 
	rule I1 / I2 => I1 /Int I2 requires I2 =/=Int 0

	rule true && B2 => B2
	rule false && _B2 => false
	rule true || _B2 => true
	rule false || B2 => B2
	rule B1 ^ B2 => B1 xorBool B2
	rule ! B => notBool B

	rule I1 == I2 => (I1 ==Int I2)
	rule I1 != I2 => (I1 =/=Int I2)
	rule I1 < I2 => (I1 <Int I2)
	rule I1 <= I2 => (I1 <=Int I2)
	rule I1 > I2 => (I1 >Int I2)
	rule I1 >= I2 => (I1 >=Int I2)

	// variable declaration
	rule <k> int X:Id = I:Int ; => . ...</k>
		 <state> STATE => STATE [ X <- I ] </state>

	// variable lookup
	rule <k> X:Id => I ...</k>
		 <state>... X |-> I ...</state>

	rule <k> X:Id = I:Int ; => . ...</k>
		 <state> STATE => STATE[ X <- I ] </state>

	rule {} => .K
	rule { S } => S

	rule S1:Stmt S2:Stmt => S1 ~> S2

	syntax KItem ::= stackFrame(K,Map)
	// return statement
	rule <k> return I:Int ; ~> _ => I ~> K </k>
		 <state> _ => STATE </state>
		 <fstack> ListItem(stackFrame(K,STATE)) => .List ...</fstack>

	// declaration sequence
	rule <k> D:Decl P:Pgm => D ~> P ...</k>
	rule <k> .Pgm => . ...</k>

	// function definitions
	rule <k> fun X:Id () B => . ...</k>
		 <functions>... .Map => X |-> B ...</functions>

	// function call
	rule <k> X:Id () ~> K => B </k>
		 <state> STATE => .Map </state>
		 <functions>... X |-> B ...</functions>
		 <fstack> .List => ListItem(stackFrame(K, STATE)) ...</fstack>

	rule if (true) B else _ => B
	rule if (false) _ else B => B

	syntax Bool ::= isKResult(K) [function, symbol(isKResult)]
  	rule isKResult(_:Int) => true
  	rule isKResult(_:Bool) => true
  	rule isKResult(_) => false [owise]

endmodule

