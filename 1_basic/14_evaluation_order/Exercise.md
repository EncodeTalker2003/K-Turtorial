### 1

Subtraction is similar to addition. The answer is in `lesson-14-a.k`.

### 2

Subtraction is similar to addition. The answer is in `lesson-14-d.k`.

### 3

#### (1)

The modification is trivial. The answer is in `lesson-14-ex1.k`.

For the expresson `1 / 0 + 2 / 1`. There are 2 evaluation results:

```k
{
    Result:GeneratedTopCell
  #Equals
    <k>
      1 / 0 ~> #freezer_+__LESSON-14-EX1-SYNTAX_Exp_Exp_Exp0_ ( 2 / 1 ~> .K ) ~> .K
    </k>
  }
#Or
  {
    Result:GeneratedTopCell
  #Equals
    <k>
      1 / 0 ~> #freezer_+__LESSON-14-EX1-SYNTAX_Exp_Exp_Exp0_ ( 2 ~> .K ) ~> .K
    </k>
  }
```

This because we have two options to evaluate which division first.

#### (2)

The answer is in `lesson-14-ex2.k`.