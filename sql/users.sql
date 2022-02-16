--1. users table 생성
create table users(
    userNo number,
    id varchar2(50) not null unique,
    userName varchar2(100) not null,
    password varchar2(50) not null,
    joinDate date not null,
    primary key(userNo) 
);

--2.users의 sequence 생성
create sequence seq_users_no
increment by 1 
start with 1  
nocache;

--3. users table 삭제
drop table users;
drop sequence seq_users_no;

--4. select
select * from users;

select	userNo,
        id,
        userName,
        password,
        to_char(joinDate, 'yyyy-mm-dd hh:mi:ss') joinDate
from users
order by joinDate desc;

--5. insert
insert into users
values(seq_users_no.nextval, 
'choihan' , 
'최한', 
'1108', 
sysdate);

--6. id 중복 체크
select count(id)
from users
where id = 'choihan';
