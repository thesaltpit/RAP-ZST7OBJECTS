CLASS zst7_amdp_class_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_amdp_marker_hdb.

    CLASS-METHODS:
      get_data_from_bkpf IMPORTING VALUE(ip_bukrs) TYPE zst7acchdr_tb-bukrs
                                   VALUE(ip_doc)   TYPE zst7acchdr_tb-belnr
                                   VALUE(ip_year)  TYPE zst7acchdr_tb-gjahr
                         EXPORTING VALUE(et_bkpf)  TYPE zst7_acchdr_tt.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zst7_amdp_class_1 IMPLEMENTATION.
  METHOD get_data_from_bkpf BY DATABASE PROCEDURE
                            FOR HDB LANGUAGE SQLSCRIPT
                            OPTIONS READ-ONLY
                            USING zst7acchdr_tb.

    et_bkpf = select *
                from ZST7ACCHDR_TB
                where bukrs = :ip_bukrs
                  AND belnr = :ip_doc
                  AND gjahr = :ip_year;


  ENDMETHOD.
ENDCLASS.
