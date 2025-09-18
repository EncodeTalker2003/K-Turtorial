module LESSON-14-EX2-SYNTAX

  imports INT
  imports BOOL

  	syntax Exp ::= Int | Bool
                | "(" Exp ")" [bracket]
				> "!" Exp [seqstrict]
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
				> left:
                  Exp "&&" Exp [seqstrict]
                | Exp "^" Exp [seqstrict]
                | Exp "||" Exp [seqstrict]
				| Exp "->" Exp [seqstrict]

endmodule

module LESSON-14-EX2
  	imports LESSON-14-EX2-SYNTAX
  	imports INT
	imports BOOL
  
	rule <k> I1 + I2 => I1 +Int I2 ...</k>
	rule <k> I1 - I2 => I1 -Int I2 ...</k>
	rule <k> I1 * I2 => I1 *Int I2 ...</k>
	rule <k> I1 / I2 => I1 /Int I2 ...</k> requires I2 =/=Int 0

	rule <k> B1 && B2 => B1 andBool B2 ...</k>
	rule <k> B1 || B2 => B1 orBool B2 ...</k>
	rule <k> B1 ^ B2 => B1 xorBool B2 ...</k>
	rule <k> B1 -> B2 => (notBool B1) orBool B2 ...</k>
	rule <k> ! B => notBool B ...</k>

	rule <k> I1 == I2 => (I1 ==Int I2) ...</k>
	rule <k> I1 != I2 => (I1 =/=Int I2) ...</k>
	rule <k> I1 < I2 => (I1 <Int I2) ...</k>
	rule <k> I1 <= I2 => (I1 <=Int I2) ...</k>
	rule <k> I1 > I2 => (I1 >Int I2) ...</k>
	rule <k> I1 >= I2 => (I1 >=Int I2) ...</k>

	syntax Bool ::= isKResult(K) [function, symbol(isKResult)]
  	rule isKResult(_:Int) => true
  	rule isKResult(_:Bool) => true
  	rule isKResult(_) => false [owise]

endmodule

