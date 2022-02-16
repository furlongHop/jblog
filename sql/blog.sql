--1. blog table 생성
create table blog(
    id varchar2(50),
    blogTitle varchar2(200) not null,
    logoFile varchar2(200),
    primary key(id),
    constraint blog_fk foreign key(id) 
    references users(id) 
);

--3. blog table 삭제
drop table blog;