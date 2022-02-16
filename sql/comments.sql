--1. comments table 생성
create table comments(
    cmtNo number,
    postNo number,
    userNo number,
    cmtContent varchar2(1000),
    regDate date not null,
    primary key(cmtNo),
    constraint comments_pn_fk foreign key(postNo)
    references post(postNo),  
    constraint comments_un_fk foreign key(userNo)
    references users(userNo)
);

--2.comments의 sequence 생성
create sequence seq_comments_no
increment by 1 
start with 1  
nocache;

--3. comments table 삭제
drop table comments;
drop sequence seq_comments_no;