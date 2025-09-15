### 3

#### (2)

When compiling with command like following, it fails.

```
kompile README.md --main-module LESSON-03-A
```

This is because several selectors contain `syntax` clause out of any module. To successfully compile the `md` file, we need to omit them like:

```
kompile README.md --main-module LESSON-03-A --md-selector 'k & (!exclude)'
```

#### (3)

```k
module LESSON-07-EX2-SYNTAX

imports DOMAINS

  syntax AExp ::= Int 
				| "(" AExp ")" [bracket]
				> AExp "*" AExp [left, function]
				| AExp "/" AExp [left, function]
				> AExp "+" AExp [left, function]
				| AExp "-" AExp [left, function]	
endmodule

module LESSON-07-EX2
  imports LESSON-07-EX2-SYNTAX

  rule I1 + I2 => I1 +Int I2
  rule I1 - I2 => I1 -Int I2
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 /Int I2 requires I2 =/=Int 0
endmodule
```
