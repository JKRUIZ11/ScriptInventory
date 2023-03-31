-- Create table
create table TBL_INV_CO_DESPACHADAS_N
(
  id_co_despachadas   NUMBER(18) not null,
  whse                VARCHAR2(16) not null,
  item_name           VARCHAR2(100) not null,
  co_desp             NUMBER(16,4),
  fecha_actualizacion DATE,
  number_1            NUMBER(18),
  number_2            NUMBER(18),
  vchar_1             VARCHAR2(2000),
  vchar_2             VARCHAR2(2000)
)


LOGGING 
NOCOMPRESS 
PARTITION BY LIST(whse)
(
PARTITION P913 VALUES('913'),
PARTITION P917 VALUES('917'),
PARTITION P924 VALUES('924'),
PARTITION P929 VALUES('929'),
PARTITION P930 VALUES('930'),
PARTITION PDEFAULT VALUES('DEFAULT'))
NOCACHE
MONITORING
;

CREATE INDEX INVCED.IDX_INV_CO_DESPACHADAS_WHSE ON INVCED.TBL_INV_CO_DESPACHADAS_N
(WHSE) LOCAL;
CREATE INDEX INVCED.IDX_INV_CO_DESPACHADAS_ITEM_NAME ON INVCED.TBL_INV_CO_DESPACHADAS_N
(ITEM_NAME) LOCAL;
CREATE INDEX INVCED.IDX_INV_CO_DESPACHADAS_WHSE_ITEM ON INVCED.TBL_INV_CO_DESPACHADAS_N
(WHSE, ITEM_NAME) LOCAL;

-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_INV_CO_DESPACHADAS_N
  add constraint INV_CO_DESPACHADAS_PK primary key (ID_CO_DESPACHADAS)
  using index 
  tablespace TSI_INVCED
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

insert /*+ append parallel(10) */ into TBL_INV_CO_DESPACHADAS_N
SELECT *
FROM TBL_INV_CO_DESPACHADAS;
commit;


alter table TBL_INV_CO_DESPACHADAS RENAME TO TBL_INV_CO_DESPACHADAS_O;
alter table TBL_INV_CO_DESPACHADAS_N RENAME TO TBL_INV_CO_DESPACHADAS;

alter table TBL_INV_CO_DESPACHADAS logging;

exec dbms_stats.gather_table_stats(ownname=>'INVCED',tabname=> 'TBL_INV_CO_DESPACHADAS', estimate_percent => 10, method_opt => 'FOR ALL COLUMNS SIZE AUTO', cascade => true, degree => 5);

DROP TABLE TBL_INV_CO_DESPACHADAS_O;

