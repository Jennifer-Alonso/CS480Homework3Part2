drop trigger if exists transactionCreated ;

SET delimiter $$$
Create trigger transactionCreated
after insert
on transactions
for each row 
begin 
    declare x decimal(15,2);
    select Amount into x  from transactions 
    where TransactionID = new.TransactionID;
    
    UPDATE Accounts
	set Balance = Balance - x
	where AccountID = new.FromAccount;
    
	UPDATE Accounts
	set Balance = Balance + x
	where AccountID = new.ToAccount;
    
end $$$
set delimiter ;
