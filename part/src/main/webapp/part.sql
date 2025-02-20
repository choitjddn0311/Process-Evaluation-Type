create table students (
sno number(10) not null primary key,
sname varchar2(10),
partno number(5)
);

insert into students values ('202201001','지효','101');
insert into students values ('202201002','나연','102');
insert into students values ('202301001','정연','103');
insert into students values ('202301002','모모','104');
insert into students values ('202401001','사나','101');
insert into students values ('202401002','미나','102');

create table part (
partno number not null primary key,
pname varchar2(20),
status number(1)
);

insert into part values ('101','컴퓨터공학','1');
insert into part values ('102','인공지능','1');
insert into part values ('103','산업공학','1');
insert into part values ('104','산업디자인','1');
insert into part values ('105','전자공학','0');

//학생 조회
select s.sno, s.sname, s.partno, p.pname 
from students s, part p
where s.partno=p.partno;

//학생 수정 - 학생번호,학생이름,학과지원
select s.sno, s.sname, p.pname 
from students s, part p
where s.partno=p.partno
   and s.sno=

//
select p.partno, p.pname from part p where p.status=1