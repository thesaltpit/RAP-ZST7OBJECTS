*&---------------------------------------------------------------------*
*& Report ZST7_DELETE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst7_delete.

*TABLES: zst7accitm_tb.
*BREAK-POINT.
*DELETE zst7accitm_tb.
*BREAK-POINT.

DATA: wa_zst7compcd_tb TYPE zst7compcd_tb.

TABLES: zst7compcd_tb.

wa_zst7compcd_tb-bukrs = '1710'.
wa_zst7compcd_tb-butxt = 'Company Code 1710'.
MODIFY zst7compcd_tb FROM wa_zst7compcd_tb.
