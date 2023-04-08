FUNCTION zst7_accdata_update.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      LT_ACCHDR STRUCTURE  ZST7ACCHDR_DFTUM OPTIONAL
*"      LT_ACCITM STRUCTURE  ZST7ACCITM_DFTUM OPTIONAL
*"----------------------------------------------------------------------

  DATA: lt_acchdr_t TYPE STANDARD TABLE OF zst7acchdr_dftum,
        ls_acchdr_t TYPE zst7acchdr_dftum,
        lt_accitm_t TYPE STANDARD TABLE OF zst7accitm_dftum,
        ls_accitm_t TYPE zst7accitm_dftum.


  IF lt_acchdr[] IS NOT INITIAL.
    INSERT zst7acchdr_dftum FROM TABLE lt_acchdr.
  ENDIF.


  IF lt_accitm[] IS NOT INITIAL.

    SELECT *
      FROM zst7accitm_dftum
      INTO TABLE lt_accitm_t
      FOR ALL ENTRIES IN lt_accitm
      WHERE item_uuid = lt_accitm-item_uuid
        AND bukrs = lt_accitm-bukrs
        AND belnr = lt_accitm-belnr
        AND gjahr = lt_accitm-gjahr
        AND buzei = lt_accitm-buzei.

    IF sy-subrc NE 0.
      INSERT zst7accitm_dftum FROM TABLE lt_accitm.
    ELSE.
      MODIFY zst7accitm_dftum FROM TABLE lt_accitm.
    ENDIF.
  ENDIF.


ENDFUNCTION.
