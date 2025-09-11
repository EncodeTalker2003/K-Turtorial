### 1

The ast is as follows:
```
`_||__LESSON-04-A_Boolean_Boolean_Boolean`(
	`_&&__LESSON-04-A_Boolean_Boolean_Boolean`(
		`true_LESSON-04-A_Boolean`(.KList),
		`false_LESSON-04-A_Boolean`(.KList)
	),
	`false_LESSON-04-A_Boolean`(.KList)
)
```

The most outer operator is `||`. However, if we exchange the `&&` and `||` operators in the grammar, the most outer operator will be `&&` instead.	

```k
module LESSON-04-A

  syntax Boolean ::= "true" | "false"
                   | "(" Boolean ")" [bracket]
                   > "!" Boolean [function]
                   > Boolean "||" Boolean [function]
                   > Boolean "^" Boolean [function]
				   > Boolean "&&" Boolean [function]

endmodule
```

```
`_&&__LESSON-04-A_Boolean_Boolean_Boolean`(
	`true_LESSON-04-A_Boolean`(.KList),
	`_||__LESSON-04-A_Boolean_Boolean_Boolean`(
		`false_LESSON-04-A_Boolean`(.KList),
		`false_LESSON-04-A_Boolean`(.KList)
	)
)
```

### 2

Changing these operators from left associative to right associative could generate the alternative parse.

### 3

#### (1)

Change the grammar to the following:

```k
module LESSON-04-F

  syntax Exp ::= "true" | "false"
  syntax Stmt ::= "if" "(" Exp ")" Stmt
                | "if" "(" Exp ")" Stmt "else" Stmt [prefer]
                | "{" "}"

endmodule
```

After this change, the ast is as follows:

```
`if(_)_else__LESSON-04-F_Stmt_Exp_Stmt_Stmt`(
	`true_LESSON-04-F_Exp`(.KList),
	`if(_)__LESSON-04-F_Stmt_Exp_Stmt`(
		`false_LESSON-04-F_Exp`(.KList),
		`{}_LESSON-04-F_Stmt`(.KList)
	),
	`{}_LESSON-04-F_Stmt`(.KList)
)
```

#### (2)

The grammar can be designed as follows:

```k
module LESSON-04-EX-2

imports DOMAINS

  syntax AExp ::= Int 
                | "(" AExp ")" [bracket]
				> "-" AExp [function]
				> AExp "*" AExp [left, function]
				| AExp "/" AExp [left, function]
				> AExp "+" AExp [left, function]
				| AExp "-" AExp [left, function]	
endmodule
```

#### (3)

The `dangle-else` problem mentioned in (1) is an example of this. 

#### (4)

The reason that the grammar is not labeled as ambiguous is that K uses Flex to generate a scanner for the grammar, which looks for the longest possible match of a regular expression in the input.

To let K recognize the grammar as ambiguous, we can change the grammar to the following:

```k
module LESSON-04-EX4

  syntax Expr ::= "a" Expr "b"
                | "a" "b" "b"
                | "b"

endmodule
```
