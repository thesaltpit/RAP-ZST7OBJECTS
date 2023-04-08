class ZST7_TEST_CLASS definition
  public
  final
  create public .

public section.

  class-methods ADD_NUMBERS
    importing
      value(IV_NUM1) type CHAR05 optional
      value(IV_NUM2) type CHAR05 optional
    exporting
      !EV_TOTAL type CHAR05 .
protected section.
private section.
ENDCLASS.



CLASS ZST7_TEST_CLASS IMPLEMENTATION.


  METHOD add_numbers.

    ev_total = iv_num1 + iv_num2.

  ENDMETHOD.
ENDCLASS.
