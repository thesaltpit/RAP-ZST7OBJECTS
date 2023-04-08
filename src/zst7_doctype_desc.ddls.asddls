@AbapCatalog.sqlViewName: 'ZST7DOCTYPDESC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Document type description'
define view ZST7_DOCTYPE_DESC as select from zst7doctyp_tb
{
    key blart as doctype,
        text as doctypdesc
        
}
