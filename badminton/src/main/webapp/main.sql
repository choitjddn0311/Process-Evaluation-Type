create table tbl_cust_202301(
cust_no char(4) not null primary key,
cust_name varchar2(14),
cust_tell varchar2(11)
);

insert into tbl_cust_202301 values('1001','박선수','01011112222');
insert into tbl_cust_202301 values('1002','백선수','01011113333');
insert into tbl_cust_202301 values('1003','채선수','01011114444');
insert into tbl_cust_202301 values('1004','임선수','01011115555');
insert into tbl_cust_202301 values('1005','한선수','01011116666');

create table tbl_court_202301(
court_no char(4) not null primary key,
used_flag char(1)
);

insert into tbl_court_202301 values('C001','N');
insert into tbl_court_202301 values('C002','N');
insert into tbl_court_202301 values('C003','N');
insert into tbl_court_202301 values('C004','N');
insert into tbl_court_202301 values('C005','N');
insert into tbl_court_202301 values('C006','N');
insert into tbl_court_202301 values('C007','N');
insert into tbl_court_202301 values('C008','N');
insert into tbl_court_202301 values('C009','N');

create table tbl_resv_202301(
resv_no char(8) not null primary key,
resv_date char(8),
court_no char(4),
cust_no char(4)
);

insert into tbl_resv_202301 values('20230001','20230101','C001','1005');
insert into tbl_resv_202301 values('20230002','20230101','C002','1004');
insert into tbl_resv_202301 values('20230003','20230101','C003','1003');
insert into tbl_resv_202301 values('20230004','20230101','C004','1002');
insert into tbl_resv_202301 values('20230005','20230101','C005','1001');

//사용일수집계
select c.cust_no, c.cust_name, count(*) 
from tbl_cust_202301 c,tbl_resv_202301 r 
where c.cust_no=r.cust_no 
group by c.cust_no, c.cust_name
order by c.cust_no;

//코트예약조회
select c.cust_no, c.cust_name, r.resv_date,r.court_no  from tbl_cust_202301 c,tbl_resv_202301 r where c.cust_no=r.cust_no and c.cust_no='"+resv_show+"';

//코트 예약 select
select * from tbl_cust_202301;