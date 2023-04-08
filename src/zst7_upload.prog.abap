*&---------------------------------------------------------------------*
*& Report ZST7_UPLOAD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst7_upload.

DATA : g_repid       LIKE sy-repid,
       g_line        LIKE sy-index,
       g_line1       LIKE sy-index,
       $v_start_col  TYPE i VALUE '1',
       $v_start_row  TYPE i VALUE '2',
       $v_end_col    TYPE i VALUE '256',
       $v_end_row    TYPE i VALUE '65536',
       gd_currentrow TYPE i.

DATA: itab    TYPE STANDARD TABLE OF alsmex_tabline,
      itab_wa TYPE alsmex_tabline,
      lt_bkpf TYPE STANDARD TABLE OF zst7acchdr_tb,
      ls_bkpf TYPE zst7acchdr_tb,
      lt_bseg TYPE STANDARD TABLE OF zst7accitm_tb,
      ls_bseg TYPE zst7accitm_tb.



SELECTION-SCREEN : BEGIN OF BLOCK blk WITH FRAME TITLE text.
  PARAMETERS : p_file LIKE rlgrap-filename OBLIGATORY.
SELECTION-SCREEN : END OF BLOCK blk.

INITIALIZATION.
  g_repid = sy-repid.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name = g_repid
    IMPORTING
      file_name    = p_file.


START-OF-SELECTION.

  PERFORM upload_data.

  PERFORM modify_bkpf_table.

  PERFORM modify_bseg_table.


end-of-SELECTION.


*&---------------------------------------------------------------------*
*& Form upload_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM upload_data .
  BREAK-POINT.
  CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
    EXPORTING
      filename                = p_file
      i_begin_col             = $v_start_col
      i_begin_row             = $v_start_row
      i_end_col               = $v_end_col
      i_end_row               = $v_end_row
    TABLES
      intern                  = itab
    EXCEPTIONS
      inconsistent_parameters = 1
      upload_ole              = 2
      OTHERS                  = 3.


ENDFORM.


*&---------------------------------------------------------------------*
*& Form modify_table
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM modify_bkpf_table .

*  LOOP AT itab INTO itab_wa.
*
*    IF itab_wa-col EQ 001.
*      ls_bkpf-bukrs = itab_wa-value.
*    ELSEIF itab_wa-col EQ 002.
*      ls_bkpf-belnr = itab_wa-value.
*    ELSEIF itab_wa-col EQ 003.
*      ls_bkpf-gjahr = itab_wa-value.
*    ELSEIF itab_wa-col EQ 004.
*      ls_bkpf-blart = itab_wa-value.
*    ELSEIF itab_wa-col EQ 005.
*      ls_bkpf-bldat = itab_wa-value.
*    ELSEIF itab_wa-col EQ 006.
*      ls_bkpf-usnam = itab_wa-value.
*    ELSEIF itab_wa-col EQ 007.
*      ls_bkpf-tcode = itab_wa-value.
*    ELSEIF itab_wa-col EQ 008.
*      ls_bkpf-xblnr = itab_wa-value.
*      APPEND ls_bkpf TO lt_bkpf.
*      CLEAR: ls_bkpf, itab_wa.
*    ENDIF.
*
*  ENDLOOP.
*
*  MODIFY zst7acchdr_tb FROM TABLE lt_bkpf.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form modify_bseg_table
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM modify_bseg_table .

  LOOP AT itab INTO itab_wa.

    IF itab_wa-col EQ 001.
      ls_bseg-bukrs = itab_wa-value.
    ELSEIF itab_wa-col EQ 002.
      ls_bseg-belnr = itab_wa-value.
    ELSEIF itab_wa-col EQ 003.
      ls_bseg-gjahr = itab_wa-value.
    ELSEIF itab_wa-col EQ 004.
      ls_bseg-buzei = itab_wa-value.
    ELSEIF itab_wa-col EQ 005.
      ls_bseg-bschl = itab_wa-value.
    ELSEIF itab_wa-col EQ 006.
      ls_bseg-koart = itab_wa-value.
    ELSEIF itab_wa-col EQ 007.
      ls_bseg-shkzg = itab_wa-value.
    ELSEIF itab_wa-col EQ 008.
      ls_bseg-gsber = itab_wa-value.
    ELSEIF itab_wa-col EQ 009.
      ls_bseg-mwskz = itab_wa-value.
    ELSEIF itab_wa-col EQ 010.
      ls_bseg-dmbtr = itab_wa-value.
    ELSEIF itab_wa-col EQ 011.
      ls_bseg-mwsts = itab_wa-value.
    ELSEIF itab_wa-col EQ 012.
      ls_bseg-kostl = itab_wa-value.
    ELSEIF itab_wa-col EQ 013.
      ls_bseg-lifnr = itab_wa-value.
      APPEND ls_bseg TO lt_bseg.
      CLEAR: ls_bseg, itab_wa.
    ENDIF.

  ENDLOOP.

  MODIFY zst7accitm_tb FROM TABLE lt_bseg.

ENDFORM.
