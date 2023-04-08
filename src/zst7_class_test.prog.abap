*&---------------------------------------------------------------------*
*& Report ZST7_CLASS_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst7_class_test.

DATA: lv_total           TYPE char05,
      lc_zst7_test_class TYPE REF TO zst7_test_class.


SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num1 TYPE char05,
              p_num2 TYPE char05.
SELECTION-SCREEN: END OF BLOCK b1.


START-OF-SELECTION.
  BREAK-POINT.

  CALL METHOD zst7_test_class=>add_numbers
    EXPORTING
      iv_num1  = p_num1
      iv_num2  = p_num2
    IMPORTING
      ev_total = lv_total.

  CREATE OBJECT lc_zst7_test_class.

  CALL METHOD lc_zst7_test_class->add_numbers
    EXPORTING
      iv_num1  = p_num1
      iv_num2  = p_num2
    IMPORTING
      ev_total = lv_total.

  IF sy-subrc EQ 0.

  ENDIF.

end-OF-SELECTION.
