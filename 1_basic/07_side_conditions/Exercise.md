### 1

Add the following rule to the `lesson-07-a.k` .

```k
module LESSON-07-A
  ...
  rule gradeFromPercentile(I) => letter-B requires I >=Int 80 andBool I <Int 90
endmodule
```

### 2

The rules are written in `lesson-07-b.k`.

```k
module LESSON-07-B
  ...

  rule gradeFromPercentile(I) => letter-F requires I <Int 60
  rule gradeFromPercentile(I) => letter-D requires I <Int 70 [owise]
endmodule
```


### 3

#### (1)

Answer is provided in `lesson-07-ex1.k`.
```k
module LESSON-07-EX1
  imports INT
  imports BOOL

  syntax Bool ::= isEven(Int) [function]

  rule isEven(I) => true  requires I modInt 2 ==Int 0

  rule isEven(_) => false [owise]
endmodule
```

#### (2)

The answer is in `lesson-07-ex2.k`. We just need to modify the division rule.

```k
...
module LESSON-07-EX2
  imports LESSON-07-EX2-SYNTAX

  ...
  rule I1 / I2 => I1 /Int I2 requires I2 =/=Int 0
endmodule
```

#### (3)

The answer is in `lesson-07-ex3.k`. First, evaluate the values of expressions on both sides of the equality, then compare their difference with 0.
