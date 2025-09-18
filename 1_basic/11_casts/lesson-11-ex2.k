module LESSON-11-EX2-SYNTAX

  imports INT
  imports BOOL

  	syntax Exp ::= Int | Bool
                | "(" Exp ")" [bracket]
				> "!" Exp
				> left:
				  Exp "*" Exp 
				| Exp "/" Exp
				> left:
				  Exp "+" Exp
				| Exp "-" Exp
				> left: 
				  Exp "==" Exp 
				| Exp "!=" Exp
				| Exp "<" Exp 
				| Exp "<=" Exp 
				| Exp ">" Exp 
				| Exp ">=" Exp 
				> left:
                  Exp "&&" Exp 
                | Exp "^" Exp 
                | Exp "||" Exp 
				| Exp "->" Exp

	syntax Exp ::= eval(Exp) [function]

endmodule

module LESSON-11-EX2
  	imports LESSON-11-EX2-SYNTAX
  	imports INT
	imports BOOL
  
	rule eval(I:Int) => I
	rule eval(B:Bool) => B

	rule eval(! E) => notBool {eval(E)}:>Bool

	rule eval(E1 * E2) => {eval(E1)}:>Int *Int {eval(E2)}:>Int
	rule eval(E1 / E2) => {eval(E1)}:>Int /Int {eval(E2)}:>Int requires {eval(E2)}:>Int =/=Int 0

	rule eval(E1 + E2) => {eval(E1)}:>Int +Int {eval(E2)}:>Int
	rule eval(E1 - E2) => {eval(E1)}:>Int -Int {eval(E2)}:>Int

	rule eval(E1 == E2) => ({eval(E1)}:>Int ==Int {eval(E2)}:>Int)
	rule eval(E1 != E2) => ({eval(E1)}:>Int =/=Int {eval(E2)}:>Int)
	rule eval(E1 < E2) => ({eval(E1)}:>Int <Int {eval(E2)}:>Int)
	rule eval(E1 <= E2) => ({eval(E1)}:>Int <=Int {eval(E2)}:>Int)
	rule eval(E1 > E2) => ({eval(E1)}:>Int >Int {eval(E2)}:>Int)
	rule eval(E1 >= E2) => ({eval(E1)}:>Int >=Int {eval(E2)}:>Int)

	rule eval(E1 && E2) => {eval(E1)}:>Bool andBool {eval(E2)}:>Bool
	rule eval(E1 ^ E2) => {eval(E1)}:>Bool xorBool {eval(E2)}:>Bool
	rule eval(E1 || E2) => {eval(E1)}:>Bool orBool {eval(E2)}:>Bool
	rule eval(E1 -> E2) => (notBool {eval(E1)}:>Bool) orBool {eval(E2)}:>Bool

endmodule
