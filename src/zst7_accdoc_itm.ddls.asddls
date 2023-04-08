@AbapCatalog.sqlViewName: 'ZST7ACCITM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting document items'
@VDM.viewType: #BASIC
@Metadata.allowExtensions: true
define view ZST7_ACCDOC_ITM as select from zst7accitm_tb   //bseg
//association [1..1] to ZST7_ACCTYPE_DESC as _accTypDesc on $projection.acctype = _accTypDesc.acctyp
{
  key bukrs as compcode,
  key belnr as docno,
  key gjahr as fiscyear,
      buzei as linenum, 
      bschl as postkey,
      koart as acctype,
      shkzg as dbcrindc,
      gsber as bussarea,
      dmbtr as amount,
      mwskz as taxcode,
      mwsts as taxamt,
      waers as currcode,
      kostl as costcntr,
      lifnr as vendornum,
      
      case koart
      when 'A' then 'Assets'
      when 'D' then 'Customers'
      when 'K' then 'Vendors'
      when 'M' then 'Materials'
      when 'S' then 'G/L Accounts'
      end as acctypdesc, 
      
      case gsber
      when '0001' then 'Business Area 1'
      end as bussareadesc,
      
      case shkzg
      when 'H' then 'Credit'
      when 'S' then 'Debit'
      end as dbcrtext
      
      
      //_accTypDesc
            
}
