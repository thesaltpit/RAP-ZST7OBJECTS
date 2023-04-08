@AbapCatalog.sqlViewName: 'ZST7ACCALL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting document details'
//@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define view ZST7_ACCDOC_ALL
  as select from ZST7_ACCDOC_HDR //zst7acchdr_tb
  association [1..*] to ZST7_ACCDOC_ITM   as _itemData    on  $projection.compcd = _itemData.compcode
                                                          and $projection.docnum = _itemData.docno
                                                          and $projection.fiscyr = _itemData.fiscyear
  association [1..*] to ZST7_COMPCD_DESCR as _compDesc    on  $projection.compcd = _compDesc.compcd
  association [1..*] to ZST7_DOCTYPE_DESC as _docTypeDesc on  $projection.doctype = _docTypeDesc.doctype
{
  key compcode                as compcd,
  key docno                   as docnum,
  key fiscyear                as fiscyr,
  key _itemData.linenum       as linenum,
      hdrtxt                  as hdrtxt,
      _itemData.postkey       as postkey,
      @ObjectModel.text.element: ['acctypdesc']
      _itemData.acctype       as acctype,
      @Semantics.text: true
      _itemData.acctypdesc    as acctypdesc,
      @ObjectModel.text.element: ['dbcrtext']
      _itemData.dbcrindc      as dbcrindc,
      @Semantics.text: true
      _itemData.dbcrtext      as dbcrtext,
      @ObjectModel.text.element: ['bussareadesc']
      _itemData.bussarea      as bussarea,
      @Semantics.text: true
      _itemData.bussareadesc  as bussareadesc,
      _compDesc.descr         as compcdescr,
      @ObjectModel.text.element: ['doctypdesc']
      doctype                 as doctype,
      @Semantics.text: true
      _docTypeDesc.doctypdesc as doctypdesc,
      doctdate                as docdate,
      usernm                  as username,
      tcode                   as tcode,
      refdoc                  as refdocno,
      _itemData.taxcode       as taxcode,
      @ObjectModel.text.element: ['currcode']
      _itemData.amount        as amt,
      @Semantics.text: true
      _itemData.currcode      as currcode,
      _itemData.costcntr      as costcntr,
      _itemData.vendornum     as vendor,

      /*case when _itemData.dmbtr > 100 then 'Approved'
      else 'Not Approved'
      end as isAmountApproved,*/

      //Associations
      _itemData
}
group by compcode, 
         docno, 
         fiscyear, _itemData.linenum, hdrtxt, _itemData.postkey, _itemData.acctype, _itemData.acctypdesc, 
         _itemData.dbcrindc, _itemData.dbcrtext, _itemData.bussarea, _itemData.bussareadesc, _compDesc.descr,
         doctype, _docTypeDesc.doctypdesc, doctdate, usernm, tcode, refdoc, _itemData.taxcode, _itemData.amount, 
         _itemData.currcode, _itemData.costcntr, _itemData.vendornum
