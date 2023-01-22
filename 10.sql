-- . Write a trigger which, when a person is removed from the database, removes the comments on all transactions
-- made by the accounts the person owned at the time of removal.

drop trigger if exists delete_Comment;
DELIMITER $$
create trigger delete_Comment
before delete
on PERSON for each row
begin
    delete from TransactionComment
    where TransactionID in 
        (select TransactionID from
        (select AccountID from PERSON inner join Accounts on PersonID=old.PID) as table1 inner join
        Transactions on table1.AccountID = FromAccount or table1.AccountID = ToAccount);
end $$
DELIMITER ;


