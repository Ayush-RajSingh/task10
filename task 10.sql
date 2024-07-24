select * from vechical

create or replace function updated_price()
returns trigger as $$
begin
	if new.price > 20000 then
	new.new_price := new.price +100;
	end if;
return new;
end
$$ language plpgsql;


create trigger trigger_updated_price
before insert on vechical
for each row
execute function updated_price()


insert into vechical (id,name,price,is_deleted,model) values(15,'SUV15',5600000,'true','mode15')
insert into vechical (id,name,price,is_deleted,model) values(16,'Scar16',242534210,'true','mode16')