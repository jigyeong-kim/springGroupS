show tables;

create table crime (
	idx int not null auto_increment primary key,
	year int not null, /* 발생년도 */
	police varchar(20) not null, /* 경찰서명 */
	robbery int, /* 강도 */
	theft int, /* 절도 */
	murder int, /* 살인 */
	violence int /* 폭력 */
);

desc crime;

select * from crime order by year, police;

select year, 
sum(robbery) as totRobbery, sum(theft) as totTheft, sum(murder) as totMurder, sum(violence) as totViolence,
sum(robbery) as avgRobbery, sum(theft) as avgTheft, sum(murder) as avgMurder, sum(violence) as avgViolence
from crime
where year=2024 and police like '청주%'
order by year, police;