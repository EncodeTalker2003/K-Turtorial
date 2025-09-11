requires "lesson-05-ex2-syntax.k"

module LESSON-05-EX2

  imports LESSON-05-EX2-SYNTAX

  rule colorOf(Banana()) => Yellow()
  rule colorOf(Blueberry()) => Blue()
  rule colorOf(Kiwi()) => Green()
  rule colorOf(Blackberry()) => Black()
endmodule