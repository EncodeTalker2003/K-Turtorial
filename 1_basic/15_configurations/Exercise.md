### 1

The answer is in `lesson-15-ex1.k`. We add a `env` cell to the definition that controls the method of integer division. We use `\Int` if and only if the value in the `env` cell is `true`, and we use `divInt` otherwise.

```k
module LESSON-15-EX1
  ...

  configuration <k> $PGM:Exp </k>
				<env> $FLAG:Bool </env>

  ...
  rule <k> I1:Int / I2:Int => I1 /Int I2 ...</k> 
	   <env> true </env> requires I2 =/=Int 0
  rule <k> I1:Int / I2:Int => I1 divInt I2 ...</k> 
	   <env> false </env> requires I2 =/=Int 0

  ...
endmodule
```

Now we could run the following commands to see the difference:

```
➜  15_configurations git:(main) ✗ krun -cPGM='-7 / 3' -cFLAG='true'
<generatedTop>
  <k>
    -2 ~> .K
  </k>
  <env>
    true
  </env>
</generatedTop>
➜  15_configurations git:(main) ✗ krun -cPGM='-7 / 3' -cFLAG='false'
<generatedTop>
  <k>
    -3 ~> .K
  </k>
  <env>
    false
  </env>
</generatedTop>
```

### 2

The answer is in `lesson-15-ex2.k`. The modification is quite simple.

```k
module LESSON-15-EX2
  ...
  configuration <T>
  					<k> $PGM:Exp </k>
					<env> $FLAG:Bool </env>
				</T>

  ...
endmodule
```

