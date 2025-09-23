 module LESSON-15-EX3-SYNTAX
  imports UNSIGNED-INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Exp ::= Int
               | Bool
			   > left: Exp "/" Exp [strict]
               > left: Exp "+" Exp [strict]
               > left: Exp "&&" Exp [seqstrict]

  syntax Stmt ::= Bool ";" Exp 
				| "reset" ";" Exp 
endmodule

module LESSON-15-EX3
  imports LESSON-15-EX3-SYNTAX
  imports INT
  imports BOOL

  configuration <T>
  					<k> $PGM:Stmt </k>
					<states>
						<state> false </state>
					</states>
				</T>

  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>
  rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k> 
	   <state> true </state> requires I2 =/=Int 0
  rule <k> I1:Int / I2:Int => I1 divInt I2 ...</k> 
	   <state> false </state> requires I2 =/=Int 0

  rule <k> B:Bool ; E:Exp => E ...</k>
	   <state> false => B </state>

  rule <k> reset ; E:Exp => E ...</k>
	   (<states>... .Bag </states> => <states> .Bag ...</states>)

  syntax Bool ::= isKResult(K) [function, symbol(isKResult)]
  rule isKResult(_:Int) => true
  rule isKResult(_:Bool) => true
  rule isKResult(_) => false [owise]
endmodule