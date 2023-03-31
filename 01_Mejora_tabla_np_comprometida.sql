-- Create table
create table TBL_INV_NP_COMPROMETIDAS_N
(
  id_np_comprometidas NUMBER(18) not null,
  sticker             VARCHAR2(200) not null,
  id_alm_ent          NVARCHAR2(12) not null,
  org_lvl_child       NUMBER(12) not null,
  id_estado           NUMBER(3) not null,
  fecha_actualizacion DATE not null,
  qty_pend            NUMBER(5),
  sku_id              VARCHAR2(100),
  number_1            NUMBER(18),
  number_2            NUMBER(18),
  vchar_1             VARCHAR2(2000),
  vchar_2             VARCHAR2(2000)
)
LOGGING 
NOCOMPRESS 
PARTITION BY LIST(id_alm_ent)
(
PARTITION P913 VALUES('913'),
PARTITION P917 VALUES('917'),
PARTITION P924 VALUES('924'),
PARTITION P929 VALUES('929'),
PARTITION P930 VALUES('930'),
PARTITION PDEFAULT VALUES('DEFAULT')
)
NOCACHE
MONITORING  
  ;


CREATE INDEX IDX_COMPROMETIDAS_ID_ALM_ENT ON TBL_INV_NP_COMPROMETIDAS_N
(ID_ALM_ENT) LOCAL;
CREATE INDEX IDX_COMPROMETIDAS_SKU_ID ON TBL_INV_NP_COMPROMETIDAS_N
(SKU_ID) LOCAL;
CREATE INDEX IDX_COMPROMETIDAS_STICKER ON TBL_INV_NP_COMPROMETIDAS_N
(STICKER) LOCAL;
CREATE INDEX IDX_COMPROMETIDAS_ALM_SKU ON TBL_INV_NP_COMPROMETIDAS_N
(ID_ALM_ENT,SKU_ID) LOCAL;

-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_INV_NP_COMPROMETIDAS_N
  add constraint TBL_INV_NP_COMPROMETIDAS_N_PK primary key (id_np_comprometidas)
  disable
  novalidate;

insert /*+ append parallel(10) */ into TBL_INV_NP_COMPROMETIDAS_N
SELECT *
FROM TBL_INV_NP_COMPROMETIDAS;
commit;


alter table TBL_INV_NP_COMPROMETIDAS RENAME TO TBL_INV_NP_COMPROMETIDAS_O;
alter table TBL_INV_NP_COMPROMETIDAS_N RENAME TO TBL_INV_NP_COMPROMETIDAS;

alter table TBL_INV_NP_COMPROMETIDAS logging;

exec dbms_stats.gather_table_stats(ownname=>'INVCED',tabname=> 'TBL_INV_NP_COMPROMETIDAS', estimate_percent => 10, method_opt => 'FOR ALL COLUMNS SIZE AUTO', cascade => true, degree => 5);

DROP TABLE TBL_INV_NP_COMPROMETIDAS_O;

