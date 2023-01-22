Drop procedure if exists CreateAccount;

SET delimiter $$$
Create procedure create_account(FName varchar(50), LName varchar(50))
modifies sql data
begin
    INSERT INTO person (FirstName, LastName) 
	SELECT FName,LName
	WHERE NOT EXISTS (SELECT PID FROM person
	WHERE FirstName=FName AND LastName=LName);
    insert into accounts (TypeID,PersonID, Balance)
    select typeID, PID, 0.0 from (
		select typeID from accountType
		where TypeName = "Savings"
        ) as t1
		join
        (select * from (
		select PID from person 
        where FirstName=FName AND LastName=LName
        )as t0) as t2;
end $$$
Delimiter ;

