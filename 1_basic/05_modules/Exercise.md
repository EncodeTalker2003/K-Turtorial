### 1

We could modify `lesson-05-d.k` as follows:

```k
module LESSON-05-D-SYNTAX
  syntax Boolean ::= "true" | "false"
  syntax Boolean ::= "not" Boolean [function]
endmodule

module LESSON-05-D-NOT-TRUE
  imports LESSON-05-D-SYNTAX

  rule not true => false
endmodule

module LESSON-05-D-NOT-FALSE
  imports LESSON-05-D-SYNTAX

  rule not false => true
endmodule

module LESSON-05-D
  imports LESSON-05-D-NOT-TRUE
  imports LESSON-05-D-NOT-FALSE
endmodule
```

### 2

When we modify the name of `COLOROF` to any other name, e.g., `COLOR-OF`, the compilation would fail with the following error:

```
[Error] Compiler: Could not find main module with name COLOROF in definition.
Use --main-module to specify one.
```

It indicates that K could not find the main module that named as `COLOROF` by default. We could specify the main module in the command line as follows:

```
kompile colorOf.k --main-module 'COLOR-OF'
```