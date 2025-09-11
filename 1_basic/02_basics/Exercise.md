### 1

```
colorOf(Blueberry())
```


### 2

Modify the `lesson-02-d.k` as follows:

```k
module LESSON-02-D

  syntax Color ::= Yellow()
                 | Blue()
                 | Green()
                 | colorOf(Fruit) [function]
  syntax Fruit ::= Banana()
                 | Blueberry()
				 | Kiwi()
				 

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Kiwi()) => Green()

endmodule
```

### 3

#### (1)

Modify the `lesson-02-d.k` as follows:

```k
module LESSON-02-D

  syntax Color ::= Yellow()
                 | Blue()
                 | Green()
				 | Black()
                 | colorOf(Fruit) [function]
  syntax Fruit ::= Banana()
                 | Blueberry()
				 | Kiwi()
				 | Blackberry()
				 

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Kiwi()) => Green()
  rule colorOf(Blackberry()) => Black()

endmodule
```

#### (2)

The program is in `lesson-02-e.k`.

```k
module LESSON-02-E

  syntax Boolean ::= True() | False()
  syntax Color ::= Black() | White()
  syntax Hat ::= Hat(Color)
  syntax Shirt ::= Shirt(Color)
  syntax Pants ::= Pants(Color)
  syntax Shoes ::= Shoes(Color)
  syntax Outfit ::= Outfit(Hat,Shirt,Pants,Shoes)
  syntax Boolean ::= outfitMatching(Outfit) [function]

  rule outfitMatching(Outfit(Hat(C), Shirt(C), Pants(C), Shoes(C))) => True()

endmodule
```

The execution results are like the following:

```
.../1_basic/02_basics$ krun -cPGM='outfitMatching(Outfit(Hat(Black()), Shirt(Black()), Pants(Black()), Shoes(Black())))' --definition 'lesson-02-e-kompiled'
<k>
  True ( ) ~> .K
</k>
.../1_basic/02_basics$ krun -cPGM='outfitMatching(Outfit(Hat(White()), Shirt(White()), Pants(White()), Shoes(White())))' --definition 'lesson-02-e-kompil
ed'
<k>
  True ( ) ~> .K
</k>
.../1_basic/02_basics$ krun -cPGM='outfitMatching(Outfit(Hat(Black()), Shirt(Black()), Pants(Black()), Shoes(White())))' --definition 'lesson-02-e-kompil
ed'
[Error] krun: lesson-02-e-kompiled/interpreter
/tmp/.krun-2025-09-10-17-23-01-AKjRgPTbrG/tmp.in.76wXz9Y9Ta -1
/tmp/.krun-2025-09-10-17-23-01-AKjRgPTbrG/result.kore
outfitMatching ( Outfit ( Hat ( Black ( ) ) , Shirt ( Black ( ) ) , Pants ( Black ( ) ) , Shoes ( White ( ) ) ) )
```