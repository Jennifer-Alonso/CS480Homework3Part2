-- 5

Drop procedure if exists close_account;

SET delimiter $$$
Create procedure close_account(uno integer, dos integer)
modifies sql data
begin
declare amount decimal(15,2);

select Balance into amount from accounts
where AccountID = uno; 

UPDATE Accounts
set balance = balance + amount
where AccountID = dos;


delete from transactions
where FromAccount = uno
or ToAccount = uno;

delete from accounts
where AccountID = uno;

end $$$
Delimiter ;
