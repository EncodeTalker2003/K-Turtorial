module LESSON-06-B
  imports BOOL

  syntax Fruit ::= Blueberry() | Banana() | BlueberryAndBanana()
  syntax Bool ::= isBlue(Fruit) [function]

  rule isBlue(Blueberry()) => true
  rule isBlue(Banana()) => false
  rule isBlue(BlueberryAndBanana()) => true

  syntax Bool ::= isYellow(Fruit) [function]
                | isBlueOrYellow(Fruit) [function]

  rule isYellow(Banana()) => true
  rule isYellow(Blueberry()) => false
  rule isYellow(BlueberryAndBanana()) => true

  rule isBlueOrYellow(F) => isBlue(F) orBool isYellow(F)

  syntax Bool ::= isBlueAndNotYellow(Fruit) [function]

  rule isBlueAndNotYellow(F) => isBlue(F) andBool (notBool isYellow(F))
endmodule