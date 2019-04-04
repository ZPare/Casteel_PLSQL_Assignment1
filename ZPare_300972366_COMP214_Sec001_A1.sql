/*Question One*/
select first ||' '|| last from officers 
join crime_officers using(officer_id) 
group by last, first 
having count(crime_id) < (select max(count(crime_id)) 
from crime_officers group by officer_id);

/*Question Two*/
select first ||' '|| last from criminals join crimes 
using (criminal_id) group by last, first 
having (count(crime_id) > (select AVG(count(crime_id)) 
from crimes group by crime_id));

/*Question Three*/
select * from appeals where (hearing_date-filing_date)< (select AVG(hearing_date - filing_date) from appeals);

/*Question Four*/
select first||' '|| last from prob_officers join sentences 
using (prob_id) group by last, first 
having (count(prob_id)) > (select (AVG(count(prob_id))) 
from sentences group by prob_id);

/*Question Five*/
select crime_id from appeals group by crime_id 
having Count(appeal_id) = (select Min(count(appeal_id))
from appeals group by crime_id);