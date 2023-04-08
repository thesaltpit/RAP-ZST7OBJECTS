@AbapCatalog.sqlViewName: 'ZST7ACCDOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting document header'
@VDM.viewType: #BASIC
define view ZST7_ACCDOC_HDR as select from zst7acchdr_tb //bkpf
{
    key bukrs as compcode,
    key belnr as docno,
    key gjahr as fiscyear,
        blart as doctype,
        bldat as doctdate,
        usnam as usernm,
        bktxt as hdrtxt,
        tcode as tcode,
        xblnr as refdoc
        
}
