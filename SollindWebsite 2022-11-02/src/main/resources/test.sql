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
insert into Member values('namunsoo','test','nms','addr_soldesk', sysdate, 'test.jsp');
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
create sequence Board_seq;
--drop sequence Board_seq;
select * from Board;
--drop table Board cascade constraint purge;


insert into Board values(Board_seq.nextval, 'test', 'test_Title','test_text', 'namunsoo', sysdate,'freeBoardTest.img',0);


select *
from (
	select rownum as rn, b_no, b_type, b_title, b_txt, b_m_id, b_date, b_img
	from (
		select *
		from Board
		order by b_date desc
	)
)
where rn >= 0 and rn <= 3;

select * from Board where fb_no = 1;
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

insert into Board_Reply values(Board_Reply_seq.nextval, 'test_reply','namunsoo', sysdate,1);

update Board_Reply set br_txt = 'test' where br_no = 26;

delete from Board_Reply where br_no = 63;
delete from Board where b_no = 7;

select * from Board_Reply where br_b_no = 1 order by br_date desc;

select *
from (
	select rownum as rn, br_no, br_txt, br_m_id, br_date, br_b_no
	from (
		select *
		from Board_Reply
		where br_b_no = 1
		order by br_date desc
	)
)
where rn >= 0 and rn <= 10;
-----------------------------------------------------------








