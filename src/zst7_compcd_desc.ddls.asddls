@AbapCatalog.sqlViewName: 'ZST7COMPCDESC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Company code description'
//@VDM.viewType: #BASIC
define view ZST7_COMPCD_DESCR as select from zst7compcd_tb
{
    key bukrs as compcd,
        butxt as descr
}
