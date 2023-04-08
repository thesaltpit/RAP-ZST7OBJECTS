*&---------------------------------------------------------------------*
*& Report zst7_amdp_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst7_amdp_report.

DATA: gt_accdata TYPE zst7_acchdr_tt.

START-OF-SELECTION.

  IF NOT cl_abap_dbfeatures=>use_features(
          EXPORTING requested_features =
                  VALUE #(
                      ( cl_abap_dbfeatures=>call_amdp_method )
                      ( cl_abap_dbfeatures=>amdp_table_function )
                  )
  ).

    cl_demo_output=>display( 'System does not support AMDP. Use another way.' ).

  ELSE.

    zst7_amdp_class_1=>get_data_from_bkpf(
                                            EXPORTING ip_bukrs = '1710'
                                                      ip_doc = '0100000315'
                                                      ip_year = '2021'
                                            IMPORTING et_bkpf = gt_accdata
                                         ).

    cl_demo_output=>display_data(
                                    EXPORTING value = gt_accdata
                                ).

  ENDIF.

end-of-SELECTION.
