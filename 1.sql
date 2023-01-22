-- 1
delimiter $$$
create function phoneLookup(custumerID integer)
returns varchar (50)
reads SQL Data 
begin 
declare pnumber varchar(50);
	select phoneNumber into pnumber 
    from person 
    where PID = custumerID;
return pnumber;
end $$$
delimiter ;
