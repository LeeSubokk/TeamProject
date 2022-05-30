delete from board;
delete from board_reply;
update board set board_reply_count=0;

drop table board

create table board (
board_code int NOT NULL AUTO_INCREMENT,
user_id varchar(20),
board_title varchar(50),
board_content varchar(2048),
board_date date,
board_view int,
board_file varchar(100),
board_rearFile varchar(100),
board_reply_count int not null default 0,
PRIMARY KEY (board_code),
foreign key(user_id) references user(user_id)
)

CREATE TABLE board_reply (
reply_code int NOT NULL AUTO_INCREMENT,
board_code int NOT NULL,
user_id varchar(20) not null,
reply_content text NOT NULL,
reply_date timestamp not null default now(),
primary key(reply_code, board_code),
foreign key(board_code) references board(board_code) ); 

alter table board_reply modify user_id varchar(20) not null;
alter table board_reply modify reply_date timestamp not null default now();


insert into board_reply(board_code, user_id, reply_content, reply_date)
value(3, "테스터", "댓글 테스트중", SYSDATE());

drop table board_reply;

update board_reply set
user_id = '테스터_수정',
reply_content = '댓글 테스트 내용_수정'
where reply_code = 1 and board_code = 3;

select * from board_reply

alter table board add board_reply_count int not null default 0;
alter table board modify board_view int not null default 0;

