select ECECC_SHORT_ID as "КСИ", ECECC_PHONE_NUMBER "Номер АТ",  ECECC_CREATION_TS "Дата\время", ECRGN_NAME "Регион"
  from EC_ECALL_CARD ec
    inner join MS_AGGREGATED_MSD mam
      on  mam.MSAGM_AGGREGATED_MSD_ID = ec.ececc_ecall_card_id
       left join EC_REGION rg
       on mam.ECRGN_REGION_ID = rg.ECRGN_REGION_ID
      where not regexp_LIKE(ECECC_PHONE_NUMBER, '^941|^+7941|^8941') 
        and not exists (select 1 from MS_MSD$AGGREGATED_MSD mag where mag.msagm_aggregated_msd_id = mam.msagm_aggregated_msd_id)
        and ececc_creation_date between to_date('01.01.2020','dd.mm.yyyy')-3/24 and to_date('16.12.2020','dd.mm.yyyy')+1-1/86400-3/24;