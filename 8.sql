-- 8 
-- Write a trigger which, when a Savings Account exceeds 100,000, converts the type to a Super Savings Account

drop trigger if exists SuperSavings ;

SET delimiter $$$
Create trigger SuperSavings
before update
on accounts
for each row 
begin  
declare x integer;
select TypeID into x from accountType where TypeName = "Savings";

    set new.TypeID = 
    (Case
		when (new.Balance > 100000 and old.TypeID = x)then (select typeID from accountType where TypeName = "Super Savings")
        else old.TypeID
	end); 
end $$$
set delimiter ;