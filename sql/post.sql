--1. post table 생성
create table post(
    postNo number,
    cateNo number,
    postTitle varchar2(300) not null,
    postContent varchar2(4000),
    regDate date not null,
    primary key(postNo),
    constraint post_fk foreign key(cateNo)
    references category(cateNo)  
);

--2.post의 sequence 생성
create sequence seq_post_no
increment by 1 
start with 1  
nocache;

--3. post table 삭제
drop table post;
drop sequence seq_post_no;