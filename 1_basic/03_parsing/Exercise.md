### 1

The output is like this:

```
`_||__LESSON-03-A_Boolean_Boolean_Boolean`(
	`false_LESSON-03-A_Boolean`(.KList),
	`true_LESSON-03-A_Boolean`(.KList)
)
```

### 2

The first output is like this:

```
`_||__LESSON-03-D_Boolean_Boolean_Boolean`(
	`_&&__LESSON-03-D_Boolean_Boolean_Boolean`(
		`true_LESSON-03-D_Boolean`(.KList),
		`false_LESSON-03-D_Boolean`(.KList)
	),
	`false_LESSON-03-D_Boolean`(.KList)
)
```

The second output is like this:

```
`_&&__LESSON-03-D_Boolean_Boolean_Boolean`(
	`true_LESSON-03-D_Boolean`(.KList),
	`_||__LESSON-03-D_Boolean_Boolean_Boolean`(
		`false_LESSON-03-D_Boolean`(.KList),
		`false_LESSON-03-D_Boolean`(.KList)
	)
)
```

### 3

The grammar is defined in `lesson-03-ex.k` as follows:

```k
module LESSON-03-EX

imports DOMAINS

  syntax AExp ::= Int 
                | "(" AExp ")" [bracket]
				| AExp "+" AExp [function]
				| AExp "*" AExp [function]
				| AExp "-" AExp [function]
				| AExp "/" AExp [function]
				| "-" AExp [function]
endmodule
```

For the expression `1 + 2 - 3`, when compiled with command `kompile lesson-03-ex.k --gen-bison-parser`, the output is:

```
inj{SortAExp{}, SortKItem{}}(
	Lbl'UndsPlusUndsUnds'LESSON-03-EX'Unds'AExp'Unds'AExp'Unds'AExp{}(
		inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("1")),Lbl'Unds'-'UndsUnds'LESSON-03-EX'Unds'AExp'Unds'AExp'Unds'AExp{}(
			inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("2")),
			inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("3"))
		)
	)
)
```
When compiled with command ` kompile lesson-03-ex.k --gen-glr-bison-parser`, the output is:

```
inj{SortAExp{}, SortKItem{}}(
	Lblamb{SortAExp{}}(
		Lbl'Unds'-'UndsUnds'LESSON-03-EX'Unds'AExp'Unds'AExp'Unds'AExp{}(
			Lbl'UndsPlusUndsUnds'LESSON-03-EX'Unds'AExp'Unds'AExp'Unds'AExp{}(
				inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("1")),
				inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("2"))
			),
			inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("3"))
		),
		Lbl'UndsPlusUndsUnds'LESSON-03-EX'Unds'AExp'Unds'AExp'Unds'AExp{}(
			inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("1")),
			Lbl'Unds'-'UndsUnds'LESSON-03-EX'Unds'AExp'Unds'AExp'Unds'AExp{}(
				inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("2")),
				inj{SortInt{}, SortAExp{}}(\dv{SortInt{}}("3"))
			)
		)
	)
)
```

We can just write `(1 + 2) - 3` or `1 + (2 - 3)` to disambiguate the expression.
