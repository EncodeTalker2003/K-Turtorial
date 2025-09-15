module LESSON-09-C

  imports BOOL

  syntax Stmt ::= "{" Stmt "}" [format(%1%i%n%2%d%n%3), colors(Green, Green)] | "{" "}" [format(%1%2), colors(Green, Green)]
                > right:
                  Stmt Stmt [format(%1%n%2)]
                | "if" "(" Bool ")" Stmt [format(%1 %2%3%4 %5), colors(Red, Green, Green)]
                | "if" "(" Bool ")" Stmt "else" Stmt [avoid, format(%1 %2%3%4 %5 %6 %7), colors(Red, Green, Green, Red)]

endmodule