@AbapCatalog.sqlViewName: 'ZST7ACCONSUM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for accounting data'
//@VDM.viewType: #CONSUMPTION
define view ZST7_ACCDOC_ALL_CONS as select from ZST7_ACCDOC_ITM
{
        key compcode,
        key docno,
        key fiscyear,
        linenum,
        postkey,
        acctype,
        dbcrindc,
        bussarea,
        amount,
        taxcode,
        taxamt,
        currcode,
        costcntr,
        vendornum
}
