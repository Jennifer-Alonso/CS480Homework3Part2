-- Write a procedure which applies interest to all accounts in the bank, based on the interest percentage in the
-- AccountType table.

Drop procedure if exists apply_interest;

SET delimiter $$$
Create procedure apply_interest()
modifies sql data
begin
UPDATE Accounts, AccountType
    SET Balance = Balance + (Balance * (InterestRate/100))
    where Accounts.TypeID = AccountType.TypeID;
end $$$
Delimiter ;
