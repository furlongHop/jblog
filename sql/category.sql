--1. category table 생성
create table category(
    cateNo number,
    id varchar2(50),
    cateName varchar2(200) not null,
    description varchar2(500),
    regDate date not null,
    primary key(cateNo),
    constraint category_fk foreign key(id)
    references blog(id)
    
);

--2.category의 sequence 생성
create sequence seq_category_no
increment by 1 
start with 1  
nocache;

--3. category table 삭제
drop table category;
drop sequence seq_category_no;
