create table tbl_buy_stock(
buy_date char(8) not null,
stock_item_code char(6) not null,
buy_number number(6),
buy_price number(6),
dept_code char(3),
primary key(buy_date, stock_item_code)
);

insert into tbl_buy_stock values ('20220301','100001','1000','50000','100');
insert into tbl_buy_stock values ('20220301','100002','1000','60000','100');
insert into tbl_buy_stock values ('20220301','100003','1000','70000','200');
insert into tbl_buy_stock values ('20220301','100004','1000','80000','300');
insert into tbl_buy_stock values ('20220301','100005','1000','90000','400');
insert into tbl_buy_stock values ('20220302','100001','2000','55000','100');
insert into tbl_buy_stock values ('20220302','100002','3000','66000','100');
insert into tbl_buy_stock values ('20220302','100003','4000','77000','200');
insert into tbl_buy_stock values ('20220302','100004','5000','88000','300');
insert into tbl_buy_stock values ('20220302','100005','6000','99000','400');
insert into tbl_buy_stock values ('20220303','100001','1000','10000','100');
insert into tbl_buy_stock values ('20231205','100001','2000','55000','200');

create table tbl_dept(
dept_code char(3) not null primary key,
dept_name varchar2(24),
dept_offr varchar2(10)
);

insert into tbl_dept values ('100','국내펀드1팀','김국내');
insert into tbl_dept values ('200','가치주펀드1팀','이가치');
insert into tbl_dept values ('300','배당주펀드1팀','박배당');
insert into tbl_dept values ('400','채권혼합펀드1팀','조채권');

create table tbl_stock_item(
stock_item_code char(6) not null primary key,
stock_item_name char(24),
stock_item_market varchar2(10),
stock_item_category varchar2(12),
stock_item_listed_date char(8)
);

insert into tbl_stock_item values ('100001','삼성전자','코스피','전기전자','20000101');
insert into tbl_stock_item values ('100002','카카오','코스피','서비스업','20000102');
insert into tbl_stock_item values ('100003','셀트리온헬스케어','코스닥','유통','20000103');
insert into tbl_stock_item values ('100004','펄어비스','코스피','디지털','20000104');
insert into tbl_stock_item values ('100005','2차전지사업ETF','코스피','ETF','20000105');

-- 주식 종목 조회 - 종목코드, 종목명, 종목시장, 업종, 상장일
select * from tbl_stock_item;

-- 주식 매수 내역 조회 - 매수일자, 종목코드, 종목명, 매수수량, 매수가격, 부서명
select b.buy_date, b.stock_item_code, s.stock_item_name, b.buy_number, b.buy_price, d.dept_name
from tbl_buy_stock b, tbl_stock_item s,  tbl_dept d
where b.stock_item_code = s.stock_item_code
    and b.dept_code = d.dept_code;

-- 부서별 주식매수 통계 - 부서코드, 부서명, 총매수주식수, 총매수주식금액
select d.dept_code, d.dept_name, sum(b.buy_number), sum(b.buy_price * b.buy_number)
from tbl_dept d, tbl_buy_stock b
where d.dept_code = b.dept_code
group by d.dept_code, d.dept_name
order by d.dept_code;