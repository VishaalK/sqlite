create temp view userCount AS
select date, count(distinct id) as countOfUsers from test group by date;

create temp view pageHits AS
select date, sum(val) as sumOfPageHits from scratch group by date;

create temp view installHits AS
select date, sum(hits) as installPageHits from third group by date;

create temp view agg AS
select uc.date, uc.countOfUsers, ph.sumOfPageHits from userCount as uc inner join pageHits as ph on uc.date  = ph.date;

create temp view agg2 AS
select agg.*, ih.installPageHits from agg inner join installHits as ih on agg.date = ih.date;

create temp view alternateAgg AS
select uc.date, uc.countOfUsers, ph.sumOfPageHits, ih.installPageHits
from userCount as uc
inner join pageHits as ph on uc.date = ph.date
inner join installHits as ih on uc.date = ih.date;