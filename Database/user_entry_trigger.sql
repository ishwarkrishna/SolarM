Delimiter $$
drop trigger if exists tr_user_entry_for_machine $$ create definer =`root`@`localhost` trigger tr_user_entry_for_machine after insert on spagobi.sbi_user for each row begin

insert into machine.user_details(name,customer_id) values(new.user_id,1);

insert into sbi_user_attributes(id,attribute_id,attribute_value,user_in,sbi_version_in,organization) values (new.id,17,new.user_id,'biadmin','4.0','SPAGOBI');

end
$$ delimiter ;