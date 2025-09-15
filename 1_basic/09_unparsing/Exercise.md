### 1

When the operators become right associative, the unparsing result becomes:

```
<k>
  true && false && ! true ^ false || true ~> .K
</k>
```

Compared to the left associative version, we notice that the parentheses of the rightest part `false || true` are removed. This is because the parentheses are no longer needed to indicate the order of operations with right associative operators.

### 2

We need to replace some spaces with newlines in the `if` statements:

```k
module LESSON-09-C
  imports BOOL

  syntax Stmt ::= "{" Stmt "}" [format(%1%i%n%2%d%n%3)] | "{" "}" [format(%1%n%2)]
                > right:
                  Stmt Stmt [format(%1%n%2)]
                | "if" "(" Bool ")" Stmt [format(%1 %2%3%4%n%5)]
                | "if" "(" Bool ")" Stmt "else" Stmt [avoid, format(%1 %2%3%4%n%5%n%6%n%7)]
endmodule
```


### 3

#### (1)

One possible way is that 
```k
module LESSON-09-C

  imports BOOL

  syntax Stmt ::= "{" Stmt "}" [format(%1%i%n%2%d%n%3), colors(Green, Green)] | "{" "}" [format(%1%2), colors(Green, Green)]
                > right:
                  Stmt Stmt [format(%1%n%2)]
                | "if" "(" Bool ")" Stmt [format(%1 %2%3%4 %5), colors(Red, Green, Green)]
                | "if" "(" Bool ")" Stmt "else" Stmt [avoid, format(%1 %2%3%4 %5 %6 %7), colors(Red, Green, Green, Red)]

endmodule
```

#### (2)

One possible way is that 
```k
module LESSON-07-EX2-SYNTAX

imports DOMAINS

  syntax AExp ::= Int 
				| "(" AExp ")" [bracket, colors(Yellow, Yellow)]
				> AExp "*" AExp [left, function, colors(Red)]
				| AExp "/" AExp [left, function, colors(Red)]
				> AExp "+" AExp [left, function, colors(Red)]
				| AExp "-" AExp [left, function, colors(Red)]
endmodule

module LESSON-07-EX2
  imports LESSON-07-EX2-SYNTAX

  rule I1 + I2 => I1 +Int I2
  rule I1 - I2 => I1 -Int I2
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 /Int I2 requires I2 =/=Int 0
endmodule
```

