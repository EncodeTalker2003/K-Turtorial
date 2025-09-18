### 1

The answer is in file `lesson-11-b.k`.

```k
requires "lesson-11-a.k"

module LESSON-11-B
  imports LESSON-11-A
  imports BOOL

  syntax Term ::= Exp | Stmt
  syntax Bool ::= isExpression(Term) [function]
				| isStatement(Term) [function]

  rule isExpression(_E:Exp) => true
  rule isExpression(_) => false [owise]

  rule isStatement(_S:Stmt) => true
  rule isStatement(_) => false [owise]
endmodule

### 2

#### (1)

The answer is in file `lesson-11-ex1.k`.

```k
module LESSON-11-EX1
  imports INT
  imports BOOL
  imports STRING

  syntax Exp ::= Int | Bool | String | Exp "+" Exp | Exp "&&" Exp | Exp "." Exp

  syntax Exp ::= eval(Exp) [function]
  rule eval(I:Int) => I
  rule eval(B:Bool) => B
  rule eval(S:String) => S
  rule eval(E1 + E2) => {eval(E1)}:>Int +Int {eval(E2)}:>Int
  rule eval(E1 && E2) => {eval(E1)}:>Bool andBool {eval(E2)}:>Bool
  rule eval(E1 . E2) => {eval(E1)}:>String +String {eval(E2)}:>String
endmodule
```

#### (2)

The answer is in file `lesson-11-ex2.k`.

```k
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
```