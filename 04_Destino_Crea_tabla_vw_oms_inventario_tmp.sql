-- Create table
create table tbl_inv_inventario_on_tmp
(
  org_lvl_child        NUMBER,
  org_lvl_number       NUMBER,
  prd_lvl_child        NUMBER,
  prd_lvl_number       VARCHAR2(100),
  disp_neto_wms        NUMBER,
  co_pend_por_integrar NUMBER,
  co_facturadas        NUMBER,
  ss_vad               NUMBER,
  ss_falabella         NUMBER,
  ss                   NUMBER,
  disp_suma            NUMBER,
  disp_neto            NUMBER,
  fecha_actualizacion  DATE
)
LOGGING 
NOCOMPRESS 
PARTITION BY LIST(org_lvl_number)
(
PARTITION P913 VALUES('913'),
PARTITION P917 VALUES('917'),
PARTITION P924 VALUES('924'),
PARTITION P929 VALUES('929'),
PARTITION P930 VALUES('930')
PARTITION PDEFAULT VALUES('900')
)
NOCACHE
MONITORING ;

