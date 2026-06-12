-- DBMS name:      Hadoop Hive 2
-- Created on:     5/19/2022 08:00 PM

-- Table: MCOM_PROD_ORD_LINE

drop table if exists ${TARGET_DB}.MCOM_PROD_ORD_LINE;

create external table if not exists ${TARGET_DB}.MCOM_PROD_ORD_LINE (
    MD5                                 STRING          comment 'MD5 (Message-Digest Algorithm) Hash value generated to eliminate duplicates.',
    DATA_RTN_REC_CD                     VARCHAR(9)      comment 'The meaningful mnemonic used to identify a specific type of record as per bank record retention policy.',
    DATA_RTN_STRT_DT                    VARCHAR(10)     comment 'The date at which retaining for record comes into effect.',
    DATA_RTN_END_DT                     VARCHAR(10)     comment 'The date upon which records are eligible for destruction based on the record retention period assigned to the record code.',
    DATA_RTN_JURIS_CD                   VARCHAR(6)      comment 'A jurisdiction is a geographic area / sovereign territory able to implement certain legal decisions and regulations.',
    DATA_RTN_DURTN_CD                   VARCHAR(20)     comment 'The meaningful mnemonic that describes the length of time a bank record is retained.',
    CREAT_TS                            VARCHAR(29)     comment 'The date and time on which the information structure object record row or tuple resource item was recorded in the data store.',
    DEL_TS                              VARCHAR(29)     comment 'The date and time on which the information structure object record row or tuple resource item will be permanently removed from the data store.',
    ROW_ID                              VARCHAR(36)     comment 'The unique identifier assigned to tabular collection of data elements. Identifier is a Universally Unique Identifier (UUID).',
    ROW_EFECT_TS                        VARCHAR(29)     comment 'The date and time on which the tabular collection of data elements is known to be accurate valid or in effect in the real world.',
    ROW_END_TS                          VARCHAR(29)     comment 'The date and time on which the tabular collection of data elements is no longer accurate valid or in effect in the real world.',
    MTRMN_ORD_ID                        VARCHAR(36)     comment 'This field indicates the primary key of the Merchant Terminal Order.',
    MTRMN_ORD_ITM_ID                    VARCHAR(36)     comment 'This field indicates the primary key of the order item. It is unique for line item on the order.',
    MCOM_PROD_PMT_ADV_ID                VARCHAR(36)     comment 'A unique identifier assigned to the payment advice information resulting from the purchase of a Merchant Commerce Product.',
    MCOM_PROFL_NODE_ID                  VARCHAR(36)     comment 'Unique Identifier of the Node define for profile management within the Merchant Commerce.',
    MCOM_PROFL_PROD_ID                  VARCHAR(36)     comment 'Unique Identifier of the collection of information points used to give the description of a Merchant Commerce Arrangement.',
    MTRMN_ORD_REF_NO                    VARCHAR(30)     comment 'This field indicates reference for the order. This could be an identifier in bank system.',
    SVC_ITM_ID                          VARCHAR(36)     comment 'This field indicates the primary key of the service item (order case service request).',
    SVC_ITM_LN_NO                       VARCHAR(20)     comment 'Identifies or sequences an individual detail line within the service item (order case service request).',
    MTRMN_PROD_OEM_NO                   VARCHAR(36)     comment 'The primary key of the original equipment manufacturer. Only returned if the FieldName is in the select query param.',
    MTRMN_PROD_OEM_NM                   VARCHAR(60)     comment 'The name of the original equipment manufacturer. Only returned if the FieldName or AttemProduct is in the select query param.',
    MTRMN_PROD_MODL_NO                  VARCHAR(30)     comment 'The manufacturers model number for this product. Only returned if the FieldName or AttemProduct is in the select query param.',
    MTRMN_ORD_ITM_SHIP_QT               DECIMAL(8,2)    comment 'This field refers to the quantity of the item shipped.',
    MTRMN_ORD_ITM_AM                    DECIMAL(16,0)   comment 'This field indicates how much a single unit of this item costs.',
    MTRMN_ORD_TAX_AM                    DECIMAL(15,4)   comment 'This field indicates the tax amount on the order.',
    MTRMN_ORD_FEWAV_FL                  VARCHAR(1)      comment 'This field indicates whether the cost for the ordered item is assessed or waived.',
    MTRMN_PROD_LOT_QT                   DECIMAL(8,2)    comment 'The amount of the particular lotType included in this product.',
    MTRMN_PROD_LOT_TYP_CD               VARCHAR(10)     comment 'Case-20 Ea etc. Only returned if the FieldName or AttemProduct is in the select query param.',
    MRCH_SHIP_ADDR_LN_1_TX              VARCHAR(50)     comment 'This field indicates the merchants first line of the shipping street address.',
    MRCH_SHIP_ADDR_LN_2_TX              VARCHAR(50)     comment 'This field indicates the merchants second line of the shipping street address.',
    MRCH_SHIP_ADDR_PST_CD               VARCHAR(10)     comment 'This field indicates the merchants shipping zip code. Must only contain letters numbers and dashes.',
    MRCH_SHIP_CITY_NM                   VARCHAR(30)     comment 'This field indicates the merchants shipping city. Must only contain letters apostrophes commas dashes and periods.',
    MRCH_SHIP_ISO_CNTRY_CD              VARCHAR(2)      comment 'This field indicates the merchants shipping country. Will default to US if not provided in request.',
    MRCH_SHIP_PRMY_CNTCT_NM             VARCHAR(60)     comment 'NPI: This field indicates the merchant primary contact for shipping and co-ordination for the order.',
    MRCH_SHIP_ST_CD                     VARCHAR(2)      comment 'This field indicates the merchant shipping state.',
    MTRMN_ORD_SVC_LVL_CD               VARCHAR(20)     comment 'This field indicates the service level for the order. If null the cheapest quote will be selected.',
    MTRMN_ORD_SVC_LVL_DE               VARCHAR(100)    comment 'This field refers to the user readable text of the service level.',
    MRCH_SHIP_CARY_NM                   VARCHAR(100)    comment 'This field refers to the carrier who will ship the order. If null one will be selected.',
    MTRMN_PKG_CARY_CD                   VARCHAR(100)    comment 'This field refers to the carrier who shipped the package.',
    MTRMN_PKG_DLVR_TS                   VARCHAR(29)     comment 'This field indicates the date and time the package was delivered.',
    MTRMN_PKG_STAT_CD                   VARCHAR(100)    comment 'This field indicates the status of the package.',
    MTRMN_TE_BAG_SER_NO                 VARCHAR(100)    comment 'This field indicates the serial number of the plastic bag.',
    MTRMN_TAX_EXMPT_FL                  DECIMAL(1,0)    comment 'This field indicates if this merchant is tax exempt.',
    SAL_TAX_TRAN_TYP_CD                 VARCHAR(20)     comment 'An identifier for the specific transaction type to be used by the transaction.',
    SAL_TAX_CLNT_NO                     VARCHAR(40)     comment 'This field represents the customer for the transaction or line item.',
    SAL_TAX_CLNT_TAX_EXMPT_RSN_CD      VARCHAR(40)     comment 'The Reason Code can be passed through the ERP application if functionality is provided.',
    SAL_TAX_EL_CO_CD                    VARCHAR(4)      comment 'The Enterprise Ledger Company Code assigned to the sales tax assessment collection process.',
    SAL_TAX_EL_CTR_NO                   VARCHAR(10)     comment 'The enterprise ledger cost center number assigned to the sales tax assessment collection process.',
    MTRMN_CREAT_MRTH_TX                 VARCHAR(50)     comment 'This field indicates the system that created the order. API or system.',
    MTRMN_ORD_CLAS_CD                   VARCHAR(20)     comment 'This field refers to the POS Portal defined classification of the order.',
    MTRMN_BACK_ORD_TYP_CD              VARCHAR(20)     comment 'This field will tell if this order is a back order or a split order. Values are BACKORDER SPLITORDER.',
    MTRMN_ORD_STAT_CD                   VARCHAR(20)     comment 'This field refers to the status of the order. If OPEN is selected and there are any issues it will be created in DRAFT.',
    MTRMN_PKG_TRK_NO                    VARCHAR(50)     comment 'This field indicates the tracking number of the package provided by the carrier.',
    MTRMN_PKG_TYP_CD                    VARCHAR(20)     comment 'Indicates if the package was inbound or outbound. Allowed values are OUTBOUND INBOUND.',
    MRCH_SHIP_ADDR_KEYD_MANT_FL        CHAR(1)         comment 'Flag indicating that the Shipping Address on the Merchant Commerce Product Order was keyed and captured manually.',
    CREAT_CA_ID                         CHAR(5)         comment 'NPI: The Common Associate Identifier (CAI) of the employee that created the object/data (Tuple).',
    UPDT_CA_ID                          CHAR(5)         comment 'NPI: The Common Associate Identifier (CAI) of the employee that last updated the object/data (Tuple).',
    HIVE_SOR_DT                         TIMESTAMP       comment 'Hive source system date - Date when the data loaded in source.',
    HIVE_SYS_DT                         TIMESTAMP       comment 'Hive system data - Date when record got inserted to the hive table.',
    QC_PAS_FL                           VARCHAR(1)      comment 'Flag to indicate if the raw passed data quality checks.',
    QC_FAIL_FL                          BIGINT          comment 'Rank to indicates if there were any quality failures.',
    MDN_TO_PERM_FL                      VARCHAR(1)      comment 'This field indicates if there were any quality check failures.',
    PART                                INT             comment 'Source partition column.',
    DLY_BTCH_CYC_ID                     BIGINT          comment 'The daily batch cycle identifier. Represents Batch Cycle Load DateTime as integer value. Format is yyyyMMddHHmmss.',
    DLY_BTCH_PRCS_DT                    VARCHAR(10)     comment 'The daily batch process date. Format is YYYY-MM-DD.'
)
comment 'Perm table for Merchant Terminal Order Information for each merchant product purchased.'
ROW FORMAT SERDE
    'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
WITH SERDEPROPERTIES (
    'serialization.format' = '')
STORED AS INPUTFORMAT
    'org.apache.hadoop.hive.ql.io.parquet.mapred.ParquetInputFormat'
OUTPUTFORMAT
    'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
    '/haas/mc1/rmc/15/rmc/datafiles/${TARGET_DB}/mcom_prod_ord_line';
