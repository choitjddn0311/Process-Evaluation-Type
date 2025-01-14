create table member_02(
custno number(6) not null primary key,
custname varchar2(20),
phone varchar2(13),
address varchar2(60),
joindate date,
grade char(1),
city char(2)
);

insert into member_02 values('100001','김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
insert into member_02 values('100002','이축복','010-1111-3333','서울 동대문구 휘경2동','20151206','B','01');
insert into member_02 values('100003','장믿음','010-1111-4444','울릉군 울릉읍 독도1리','20151001','B','30');
insert into member_02 values('100004','최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151113','A','30');
insert into member_02 values('100005','진평화','010-1111-6666','제주도 제주시 외나무골','20151225','B','60');
insert into member_02 values('100006','차공단','010-1111-7777','제주도 제주시 외나무골','20151211','C','60');

create table money_02(
custno number(6) not null,
salenol number(8) not null,
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date,
primary key(custno, salenol)
);

insert into money_02 values('100001','20160001','500','5','2500','A001','20160101');
insert into money_02 values('100001','20160002','1000','4','4000','A002','20160101');
insert into money_02 values('100001','20160003','500','3','1500','A008','20160101');
insert into money_02 values('100002','20160004','2000','1','2000','A004','20160102');
insert into money_02 values('100002','20160005','500','1','500','A001','20160103');
insert into money_02 values('100003','20160006','1500','2','3000','A003','20160103');

//회원목록조회/수정
1)
select * from member_02;

//회원매출 조회
빌드업 방식으로 해갈것
1)
select * from member_02 r, money_02 m where r.custno=m.custno;
2)
select * from member_02 r join money_02 m on r.custno=m.custno;
3)
select r.custno, r.custname,count(m.custno), sum(m.amount),sum(m.price) from member_02 r left join money_02 m on r.custno=m.custno group by r.custno, r.custname order by r.custno;


//회원번호 자동증가
select max(custno)+1 from member_02;

//회원정보 수정
ex) update table set 칼럼명=값,칼럼명=값,칼럼명=값 where 칼럼명='값'
1)update member_02 set custname='"+custname+"',phone='"+phone+"',address='"+address+"',joindate='"+date+"',grade='"+grade+"',city='"+city+"' where custno='"+custno+"'

