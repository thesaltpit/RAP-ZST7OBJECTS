@AbapCatalog.sqlViewName: 'ZST7ACCTPDESC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Account type description'
define view ZST7_ACCTYPE_DESC as select from zst7acctyp_tb
{
    key koart as acctyp,
    acc_desc as acctypdesc
}
