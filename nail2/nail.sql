create table TBL_CUSTOMER(
CUSTOMERID char(4) NOT NULL Primary Key,
NAME varchar2(20),
JUMIN char(13),
PHONE char(13),
ADDRESS varchar2(20),
EMAIL varchar2(30)
);

insert into TBL_CUSTOMER values('C001','김고객','7901012111111','010-0000-1111','서울시','kim@abc.com');
insert into TBL_CUSTOMER values('C002','이고객','8301012111112','010-0000-1112','용인시','lee@abc.com');
insert into TBL_CUSTOMER values('C003','박고객','0301014111113','010-0000-1113','성남시','park@abc.com');
insert into TBL_CUSTOMER values('C004','정고객','9301012111115','010-0000-1114','부천시','jung@abc.com');
insert into TBL_CUSTOMER values('C005','최고객','8401011111114','010-0000-1115','의정부시','choi@abc.com');
insert into TBL_CUSTOMER values('C006','장고객','0201014111116','010-0000-1116','동두천시','jang@abc.com');

create table TBL_FERFORMANCE (
P_NUMBER number(10) NOT NULL Primary Key,
CUSTOMERID char(4),
GRADE char(1),
MENUCODE1 char(3),
MENUCODE2 char(3),
MENUCODE3 char(3),
VISITDATE char(6)
);

insert into tbl_ferformance values(1,'C001','V','N01','P01','E00','230801');
insert into tbl_ferformance values(2,'C002','G','N02','P02','E00','230801');
insert into tbl_ferformance values(3,'C003','S','N00','P00','E01','230802');
insert into tbl_ferformance values(4,'C004','G','N03','P03','E00','230802');
insert into tbl_ferformance values(5,'C005','V','N04','P04','E00','230803');
insert into tbl_ferformance values(6,'C006','S','N05','P05','E00','230803');
insert into tbl_ferformance values(7,'C001','V','N00','P00','E01','230804');
insert into tbl_ferformance values(8,'C002','G','N01','P00','E01','230804');

create table TBL_MENU (
MENUCODE char(3) NOT NULL Primary Key,
MENUNAME varchar2(30),
MENUTYPE char(1),
PRICE number(7)
);

insert into TBL_MENU values ('N00','해당없음','N','0');
insert into TBL_MENU values ('N01','풀코트','N',20000);
insert into TBL_MENU values ('N02','아트/라인아트','N',15000);
insert into TBL_MENU values ('N03','글리터','N',10000);
insert into TBL_MENU values ('N04','글라데이션','N',10000);
insert into TBL_MENU values ('N05','프렌치','N',10000);
insert into TBL_MENU values ('P00','해당없음','P','0');
insert into TBL_MENU values ('P01','풀코트','P',20000);
insert into TBL_MENU values ('P02','아트/라인아트','P',15000);
insert into TBL_MENU values ('P03','글리터','P',10000);
insert into TBL_MENU values ('P04','글라데이션','P',10000);
insert into TBL_MENU values ('P05','프렌치','P',10000);
insert into TBL_MENU values ('E00','해당없음','E','0');
insert into TBL_MENU values ('E01','손/발 기본 케어','E',30000);

//네일메뉴 조회
1)
select * from tbl_menu;

//네일아트 통계
1)
select visitdate from tbl_ferformance group by visitdate;
2)
select visitdate,count(*) from tbl_ferformance group by visitdate;
3) != , <> <== 부정
select visitdate,count(*) from tbl_ferformance where menucode1!='N00'  group by visitdate;
select visitdate,count(*) from tbl_ferformance where menucode1<>'N00'  group by visitdate;
4) 조인
select f.visitdate,count(*) from tbl_ferformance f join tbl_menu m on menucode1!='N00'  group by f.visitdate;
select f.visitdate,count(*) from tbl_ferformance f join tbl_menu m on f.menucode1 = m.menucode where menucode1!='N00'  group by f.visitdate; 
5) 마무리
select f.visitdate,count(*), sum(m.price) from tbl_ferformance f join tbl_menu m on f.menucode1 = m.menucode where menucode1!='N00'  group by f.visitdate order by f.visitdate; 
select visitdate from tbl_ferformance group by visitdate;
select f.visitdate,count(*) from tbl_ferformance f group by f.visitdate order by f.visitdate;
select f.visitdate,count(f.visitdate), sum(m.price) from tbl_ferformance f join tbl_menu m on f.menucode1=m.menucode and menucode1!='N00' group by f.visitdate order by f.visitdate;


//네일 실적 조회
1) 
select * from tbl_customer;
2)
select * from tbl_customer c join tbl_ferformance f on c.customerid=f.customerid;
3)
select * from tbl_customer c, tbl_ferformance f, tbl_menu m1, tbl_menu m2, tbl_menu m3 
where c.customerid=f.customerid 
and f.menucode1=m1.menucode 
and f.menucode2=m2.menucode 
and f.menucode3=m3.menucode
order by f.visitdate;
