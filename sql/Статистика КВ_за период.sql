 select count(ec.ECECC_ECALL_CARD_ID),to_char(cast(ececc_creation_ts as date), 'DD-MM-YYYY') as creation_date
    from EC_ECALL_CARD ec
      left outer join MS_TERMINAL t
        on CASE  WHEN t.MSTRM_DEACTIVATION_TS IS NULL THEN REGEXP_SUBSTR(t.MSTRM_AT_PHONE_NUMBER,'.{0,10}$') END = REGEXP_SUBSTR(ec.ECECC_PHONE_NUMBER, '.{0,10}$')
      left outer join MS_VEHICLE v
       on v.MSVCL_VEHICLE_ID = t.MSVCL_VEHICLE_ID
      left outer join ms_vehicle_group vg
       on vg.msvcg_vehicle_group_id = v.msvcg_vehicle_group_id
  where ececc_creation_date between to_date('01.11.2019','dd.mm.yyyy')-3/24 and to_date('31.03.2020','dd.mm.yyyy')+1-1/86400-3/24
    and nvl(vg.msvcg_group_name,'null') <> 'Терминалы ПФТ'
  group by to_char(cast(ececc_creation_ts as date), 'DD-MM-YYYY');