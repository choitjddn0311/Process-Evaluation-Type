create table tbl_student_202210(
stuid char(8) not null primary key,
sname varchar2(20),
dept_name varchar2(20),
jumin char(13),
phone char(13),
email char(30)
);

insert into tbl_student_202210 values ('20220011','김한국','사회복지과','0301013111111','010-1111-1111','hankuk@naver.com');
insert into tbl_student_202210 values ('20220012','홍길동','관광과','0202013222222','010-2222-2222','hongkil@naver.com');
insert into tbl_student_202210 values ('20220013','김미자','패션디자인과','0203014333333','010-3333-3333','kimja@naver.com');
insert into tbl_student_202210 values ('20220014','윤한얼','물리치료과','0204014444444','010-4444-4444','yoon@naver.com');
insert into tbl_student_202210 values ('20220015','김성진','모던음악과','0205013555555','010-5555-5555','kimsj@naver.com'); 
insert into tbl_student_202210 values ('20220016','조민지','건축과','0206014666666','010-6666-6666','jmg@naver.com');

create table tbl_score_202210(
sid char(8) not null primary key,
subcode char(4),
midscore number,
finalscore number,
attend number,
report number,
etc number
);

insert into tbl_score_202210 values ('20220011','A001',80,90,100,100,100);
insert into tbl_score_202210 values ('20220012','A001',85,90,90,90,80);
insert into tbl_score_202210 values ('20220013','A001',75,90,80,77,80);
insert into tbl_score_202210 values ('20220014','A001',90,90,100,100,70);
insert into tbl_score_202210 values ('20220015','A002',70,70,80,80,90);
insert into tbl_score_202210 values ('20220016','A002',96,95,100,100,90);

create table tbl_subject_202210(
subcode char(4) not null primary key,
subname varchar2(30),
proname varchar(20)
);

insert into tbl_subject_202210 values ('A001','자바','정명석');
insert into tbl_subject_202210 values ('A002','C언어','김미숙');
insert into tbl_subject_202210 values ('A003','데이터베이스','서길동');
insert into tbl_subject_202210 values ('A004','웹프로그래밍','이건원');
insert into tbl_subject_202210 values ('A005','영어','박태민');

//학생정보현황
select * from tbl_student_202210; 

//성적현황
select s.stuid, s.sname, j.subname, j.subcode, j.proname, e.midscore, e.finalscore, e.attend, e.report, e.etc, TO_CHAR((e.midscore + e.finalscore + e.attend + e.report + e.etc)/5,999), TO_NUMBER((e.midscore * 0.3 + e.finalscore * 0.3 + e.attend * 0.2 + e.report * 0.1 + e.etc * 0.1), '999.99')
from tbl_student_202210 s, tbl_subject_202210 j, tbl_score_202210 e
where s.stuid=e.sid
and e.subcode = j.subcode;

//과목별 성적조회
select s.stuid, s.sname, s.dept_name, j.subname, e.midscore, e.finalscore, e.attend, e.report, e.etc, TO_CHAR((e.midscore + e.finalscore + e.attend + e.report + e.etc)/5,999), TO_NUMBER((e.midscore * 0.3 + e.finalscore * 0.3 + e.attend * 0.2 + e.report * 0.1 + e.etc * 0.1), '999.99')
from tbl_student_202210 s, tbl_subject_202210 j, tbl_score_202210 e
where s.stuid=e.sid
and e.subcode = j.subcode
and where j.subcode = '"++"';