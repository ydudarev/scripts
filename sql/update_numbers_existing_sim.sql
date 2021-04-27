create or replace function insert_sim_cards_to_existing_establishment() returns integer as $$
declare
	simInfo RECORD;
	simCount INTEGER;
	personalAccountNumber TEXT;
	personalAccountId INTEGER;
	contractId INTEGER;
	establishmentId INTEGER;
begin
--номер лицевого счета вводить здесь-------------
select '210001856559' into personalAccountNumber;
select plt_personal_account.id from plt_personal_account where plt_personal_account.number = personalAccountNumber into personalAccountId;
select plt_personal_account.establishments_id from plt_personal_account where plt_personal_account.number = personalAccountNumber into establishmentId;
select plt_personal_account_contracts.contracts_id from plt_personal_account_contracts where plt_personal_account_contracts.plt_personal_account_id = personalAccountId into contractId;
select 0 into simCount;
raise info 'Выбран ЛС ID %', personalAccountId;
raise info 'Выбрана организация ID %', establishmentId;
raise info 'Выбран контракт ID %', contractId;
FOR simInfo IN
	SELECT * FROM (VALUES 
--начало списка сим карт-----------------
('8970177000030351343', '79413194732'),
('8970177000030351350', '79410814933')
--конец списка сим карт			   
	)AS t (iccid, msisdn)
LOOP
	select simCount + 1 into simCount;	
	insert into plt_sim (id, created_by, created_date, msisdn, iccid, life_status, type_of_card, personal_account_id)
	values ((SELECT nextval('sequence_generator')),'system', (select CURRENT_TIMESTAMP), simInfo.msisdn, simInfo.iccid, 'NEW', 'USIM', personalAccountId);
	insert into plt_sim_contract (plt_sim_id, contract_id) values ((select id from plt_sim order by id desc limit 1), contractId);
	insert into plt_sim_establishments (plt_sim_id, establishments_id) values ((select id from plt_sim order by id desc limit 1), establishmentId);
END LOOP;

raise info 'Импортировано номеров: %', simCount;

return simCount;

end;
$$ LANGUAGE plpgsql;

select * from insert_sim_cards_to_existing_establishment();
drop function insert_sim_cards_to_existing_establishment;
