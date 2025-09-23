module LESSON-17-EX1-SYNTAX
	syntax Stmt ::= "enable" | "increment" | "decrement" | "disable"
	syntax Stmts ::= List{Stmt,""}
endmodule

module LESSON-17-EX1
	imports LESSON-17-EX1-SYNTAX
	imports INT

	configuration <T>
					<k> $PGM:Stmts </k>
					<var multiplicity="?"> 0 </var>
				  </T>

	rule <k> S:Stmt P:Stmts => S ~> P ...</k>
	rule <k> .Stmts => . ...</k>

	rule <k> enable => . ...</k>
	     (.Bag => <var> 0 </var>)
	
	rule <k> increment => . ...</k>
	     <var> I => I +Int 1 </var>
	
	rule <k> decrement => . ...</k>
		 <var> I => I -Int 1 </var>
	
	rule <k> disable => . ... </k>
	     (<var> _ </var> => .Bag)
endmodule