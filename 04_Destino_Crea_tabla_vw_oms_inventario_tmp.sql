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

NOCACHE
MONITORING ;

