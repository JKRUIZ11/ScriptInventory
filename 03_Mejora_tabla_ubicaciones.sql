-- Create table
create table TBL_INV_UBICACIONES_N
(
  id_ubicacion        NUMBER(18) not null,
  id_item             NUMBER(9) not null,
  whse                VARCHAR2(16) not null,
  sku_id              VARCHAR2(100) not null,
  prd_lvl_child       VARCHAR2(50) not null,
  ubicacion           VARCHAR2(3),
  fecha_actualizacion DATE not null,
  on_hand_qty         NUMBER(23,5),
  wms_locn_id         VARCHAR2(10),
  number_1            NUMBER(18),
  number_2            NUMBER(18),
  vchar_1             VARCHAR2(2000),
  vchar_2             VARCHAR2(2000)
)

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
