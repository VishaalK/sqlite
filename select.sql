select date, count(distinct id) as countOfUsers from test group by date;

select date, sum(val) as sumOfPageHits from scratch group by date;

