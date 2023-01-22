drop trigger if exists  newCostumer;

SET delimiter $$$
Create trigger newCostumer
after insert
on person
for each row 
begin 
    declare x int;
    select TypeID into x from AccountType
    where TypeName='Checking';
    insert into accounts (TypeID, PersonID,Balance)
    select x, new.PID, 0.0;
end $$$
set delimiter ;


