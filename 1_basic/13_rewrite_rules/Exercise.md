### 1

Consider the code in `lesson-13-a.k`, it is copied from `lesson-11-e.k`. 

When we run the code `1` in this definition, we get following output:

```
<k>
  1 ~> .K
</k>
```

It is quite clear since no rewrite rules are applied.

However, when we add 2 rewrite rules in the K cell as follows:

```k
rule <k> 1 => 2 </k>
rule <k> 1 => 3 </k>
```

The output of the original code `1` becomes:

```
<k>
  2 ~> .K
</k>
```

This is only one possible output. If we enable search while compilation, we can get another output:

```
{
    Result:GeneratedTopCell
  #Equals
    <k>
      2 ~> .K
    </k>
  }
#Or
  {
    Result:GeneratedTopCell
  #Equals
    <k>
      3 ~> .K
    </k>
  }
```

### 2

When running with the program `1 + 2 + 3`, the process is as follows:
```
<k>
  1 + 2 ~> freezer2 ( 3 ) ~> .K
</k>

<k>
  3 ~> freezer2 ( 3 ) ~> .K
</k>

<k>
  3 + 3 ~> .K
</k>

<k>
  6 ~> .K
</k>
```

### 3

The answer is in `lesson-13-c.k`.

```k
module LESSON-13-C-SYNTAX
  imports UNSIGNED-INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Val ::= Int | Bool
  syntax Exp ::= Val
               > left: 
			     Exp "+" Exp
			   | Exp "-" Exp
               > left: Exp "&&" Exp
endmodule

module LESSON-13-C
  imports LESSON-13-C-SYNTAX
  imports INT
  imports BOOL

  rule <k> I1:Int + I2:Int => I1 +Int I2 ...</k>
  rule <k> B1:Bool && B2:Bool => B1 andBool B2 ...</k>
  rule <k> I1:Int - I2:Int => I1 -Int I2 ...</k>

  syntax KItem ::= freezer1(Val) | freezer2(Exp)
                 | freezer3(Val) | freezer4(Exp)
				 | freezer5(Val) | freezer6(Exp)

  rule <k> E1:Val + E2:Exp => E2 ~> freezer1(E1) ...</k> [priority(51)]
  rule <k> E1:Exp + E2:Exp => E1 ~> freezer2(E2) ...</k> [priority(52)]
  rule <k> E1:Val && E2:Exp => E2 ~> freezer3(E1) ...</k> [priority(51)]
  rule <k> E1:Exp && E2:Exp => E1 ~> freezer4(E2) ...</k> [priority(52)]
  rule <k> E1:Val - E2:Exp => E2 ~> freezer5(E1) ...</k> [priority(51)]
  rule <k> E1:Exp - E2:Exp => E1 ~> freezer6(E2) ...</k> [priority(52)]


  rule <k> E2:Val ~> freezer1(E1) => E1 + E2 ...</k>
  rule <k> E1:Val ~> freezer2(E2) => E1 + E2 ...</k>
  rule <k> E2:Val ~> freezer3(E1) => E1 && E2 ...</k>
  rule <k> E1:Val ~> freezer4(E2) => E1 && E2 ...</k>
  rule <k> E2:Val ~> freezer5(E1) => E1 - E2 ...</k>
  rule <k> E1:Val ~> freezer6(E2) => E1 - E2 ...</k>
endmodule
```