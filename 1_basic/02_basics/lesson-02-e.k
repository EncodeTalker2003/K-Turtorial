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