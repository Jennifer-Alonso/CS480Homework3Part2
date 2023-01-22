-- 9. Write a triger which, when the interest rate is set for an account type, applies that interest percentage to
-- increase the balance of all accounts of that type.

drop trigger if exists interest_rate ;

SET delimiter $$$
Create trigger interest_rate
after update
on accounttype
for each row 
begin 
update accounts 
set Balance  = Balance + (Balance * (new.InterestRate/100))
where TypeID = new.TypeID;
end $$$
set delimiter ;
