-- 2
-- Write a function which takes a customer email and returns the total balance of accounts attached to that email.
delimiter $$$
create function getBalanceFromEmail(costumerEmail varchar(50))
returns decimal(15,2)
reads SQL Data 
begin 
declare total integer;
	select sum(Balance) into total from 
    (
		select PID from person 
        where Email = costumerEmail  
    ) as t1 join 
    accounts 
    where PID = PersonID;
return total;
end $$$
delimiter ;

