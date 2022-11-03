create table Member(
	m_id varchar2(10 char) primary key,
	m_pw varchar2(15 char) not null,
	m_name varchar2(10 char) not null,
	m_addr varchar2(150 char) not null,
	m_birth date not null,
	m_photo varchar2(???) not null
);
select * from Member;
--drop table Member cascade constraint purge;
-----------------------------------------------------------

create table Company(
	c_no number(8) primary key,
	c_name varchar2(50 char) not null,
	c_people number(6) not null,
	c_open date not null,
	c_score number(2,1) not null,
	c_addr varchar2(150 char) not null
);
create sequence Company_seq;
--drop sequence Company_seq;
select * from Company
--drop table Company cascade constraint purge;
-----------------------------------------------------------

create table Company_Review(
	cr_no number(8) primary key,
	cr_score number(2,1) not null,
	cr_c_no number(8) not null,
	cr_txt varchar2(200 char) not null,
	cr_m_id varchar2(10 char) not null,
	constraint Company_Review_Writer
		foreign key(cr_m_id) references Member(m_id)
		on delete cascade,
	constraint Company_table_no
		foreign key(cr_c_no) references Company(c_no)
		on delete cascade
);
create sequence Company_Review_seq;
--drop sequence Company_Review_seq;
--select * from Company_Review;
--drop table Company_Review cascade constraint purge;
-----------------------------------------------------------

create table Board(
	b_no number(8) primary key,
	b_type varchar2(50 char) not null,
	b_title varchar2(30 char) not null,
	b_txt varchar2(500 char) not null,
	b_m_id varchar2(10 char) not null,
	b_date date not null,
	b_img varchar2(200 char) not null,
	b_ddabong number(5) not null,
	constraint Board_Writer
		foreign key(b_m_id) references Member(m_id)
		on delete cascade
);

select *
from(
	select rownum as rn, c_name, c_count
	from(
		select * 
		from company 
		order by c_count desc
	)
)
where rn >= 1 and rn <= 10

select DISTINCT c_name, c_count from Company order by c_count desc

select * from BOARD where b_date >= TO_CHAR(SYSDATE-7,'YYYY-MM-DD') order by b_ddabong
create sequence Board_seq;
--drop sequence Board_seq;
select * from Board;
--drop table Board cascade constraint purge;
-----------------------------------------------------------
select * from Company where UPPER(c_name) like UPPER('%쿠키%')
-- 오라클 boolean 타입 없음
create table Board_ddabong(
	bd_no number(8) primary key,
	bd_ddabong number(1) not null,
	bd_b_no number(8) not null,
	bd_m_id varchar2(10 char) not null,
	constraint Board_ddabong_Writer
		foreign key(bd_m_id) references Member(m_id)
		on delete cascade,
	constraint Board_ddabong_table_no
		foreign key(bd_b_no) references Board(b_no)
		on delete cascade
);
create sequence Board_ddabong_seq;
--drop sequence Board_ddabong_seq;
select * from Board_ddabong;
--drop table Board_ddabong cascade constraint purge;
-----------------------------------------------------------

create table Board_Reply(
	br_no number(8) primary key,
	br_txt varchar2(100 char) not null,
	br_m_id varchar2(10 char) not null,
	br_date date not null,
	br_b_no number(8) not null,
	constraint Board_Reply_Writer
		foreign key(br_m_id) references Member(m_id)
		on delete cascade,
	constraint Board_Reply_table_no
		foreign key(br_b_no) references Board(b_no)
		on delete cascade
);
create sequence Board_Reply_seq;
--drop sequence Board_Reply_seq;
select * from Board_Reply;
--drop table Board_Reply cascade constraint purge;
-----------------------------------------------------------

select *
from BOARD
where b_txt like '%쿠키베베%' or b_title like '%쿠키베베%' 

























