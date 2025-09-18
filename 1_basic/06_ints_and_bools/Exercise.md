### 1

The code is in `lesson-06-b.k`. Add a new fruit called `BlueberryAndBanana` that is both blue and yellow. Then, define a new function `isBlueAndNotYellow(Fruit)` that returns true if the fruit is blue but not yellow, and false otherwise.

```k
module LESSON-06-B
  imports BOOL

  syntax Fruit ::= Blueberry() | Banana() | BlueberryAndBanana()
  syntax Bool ::= isBlue(Fruit) [function]

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false
  rule isBlue(BlueberryAndBanana()) => true

  syntax Bool ::= isYellow(Fruit) [function]
                | isBlueOrYellow(Fruit) [function]

  rule isYellow(Banana()) => true
  rule isYellow(Blueberry()) => false
  rule isYellow(BlueberryAndBanana()) => true

  rule isBlueOrYellow(F) => isBlue(F) orBool isYellow(F)

  syntax Bool ::= isBlueAndNotYellow(Fruit) [function]

  rule isBlueAndNotYellow(F) => isBlue(F) andBool (notBool isYellow(F))
endmodule
```

### 2

This is defined in `lesson-06-c.k`as follows.

```k
module LESSON-06-C-SYNTAX
  imports BOOL-SYNTAX

  syntax Bool ::...
				| Bool "->" Bool [function]
endmodule

module LESSON-06-C
  imports LESSON-06-C-SYNTAX
  imports BOOL

  ...
  rule A -> B => (notBool A) orBool B
endmodule
```

### 3

#### (1)

The answer is in `lesson-06-ex1.k` as follows.

```k
module LESSON-06-EX1-SYNTAX

imports DOMAINS

  syntax AExp ::= Int 
				> AExp "*" AExp [left, function]
				| AExp "/" AExp [left, function]
				> AExp "+" AExp [left, function]
				| AExp "-" AExp [left, function]	
endmodule

module LESSON-06-EX1
  imports LESSON-06-EX1-SYNTAX
  imports INT

  rule I1 + I2 => I1 +Int I2
  rule I1 - I2 => I1 -Int I2
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 /Int I2
endmodule
```

#### (2)

To complete this, we need the syntax and rules in the previous two exercises. The answer is in `lesson-06-ex2.k` as follows.

```k
requires "lesson-06-c.k"
requires "lesson-06-ex1.k"

module LESSON-06-EX2-SYNTAX
  imports LESSON-06-EX1-SYNTAX
  imports LESSON-06-C-SYNTAX

  syntax Bool ::= AExp "==" AExp [function]
				| AExp "!=" AExp [function]
				| AExp "<" AExp [function]
				| AExp "<=" AExp [function]
				| AExp ">" AExp [function]
				| AExp ">=" AExp [function]
endmodule

module LESSON-06-EX2

  imports LESSON-06-EX2-SYNTAX
  imports LESSON-06-EX1
  imports LESSON-06-C

  rule I1 == I2 => true  requires I1 ==Int I2
  rule I1 == I2 => false requires I1 =/=Int I2
  rule I1 != I2 => true  requires I1 =/=Int I2
  rule I1 != I2 => false requires I1 ==Int I2
  rule I1 < I2  => true  requires I1 <Int I2
  rule I1 < I2  => false requires I1 >=Int I2
  rule I1 <= I2 => true  requires I1 <=Int I2
  rule I1 <= I2 => false requires I1 >Int I2
  rule I1 > I2  => true  requires I1 >Int I2
  rule I1 > I2  => false requires I1 <=Int I2
  rule I1 >= I2 => true  requires I1 >=Int I2
  rule I1 >= I2 => false requires I1 <Int I2
endmodule
```


#### (3)

The interesting part is calculating '-7 / 3' and '-7 / -3'. 
- When using `/Int`, the result is `-2` and `2`
- When using `divInt`, the result is `-3` and `3`

The difference is because the two operations take different approaches, which is shown in [domains.md](https://kframework.org/k-distribution/include/kframework/builtin/domains/#integers). `/Int` does the t-division, which truncates the quotient towards zero. `divInt` does the e-division, which ensures the remainder is always non-negative.