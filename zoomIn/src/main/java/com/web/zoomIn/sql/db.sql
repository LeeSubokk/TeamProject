alter table user modify user_gender varchar(10);
desc user;


create table board (
board_code int primary key,
user_id varchar(20),
board_title varchar(50),
board_content varchar(2048),
board_date datetime,
board_view int,
board_file varchar(100),
board_rearFile varchar(100),
board_group int,
board_sequence int,
board_level int,
foreign key(user_id) references user(user_id)
);

create table board (
board_code int NOT NULL AUTO_INCREMENT,
user_id varchar(20),
board_title varchar(50),
board_content varchar(2048),
board_date datetime,
board_view int,
board_file varchar(100),
board_rearFile varchar(100),
board_group int,
board_sequence int,
board_level int,
PRIMARY KEY (board_code),
foreign key(user_id) references user(user_id)
)


CREATE TABLE place
(
	place_code int NOT NULL AUTO_INCREMENT COMMENT '코드',
	place_name varchar(50) NOT NULL COMMENT '장소 이름',
	place_address varchar(50) NOT NULL COMMENT '장소 주소',
	place_tell varchar(20) COMMENT '장소 전화번호',
	place_business_hours varchar(20) NOT NULL COMMENT '장소 영업시간',
	category_name varchar(10) COMMENT '장소 카테고리',
	PRIMARY KEY (place_code)
) COMMENT = '새 테이블';

drop table place;

create table user (
user_id varchar(20) primary key,
user_password varchar(256),
user_name varchar(20),
user_birthday date,
user_gender varchar(2),
user_phone varchar(20),
user_email varchar(50),
user_postcode varchar(30),
user_roadAddress varchar(30),
user_detailAddress varchar(30),
user_extraAddress varchar(30),
user_grade varchar(5) );


delete from board_reply where user_id = 'aa';
delete from board where user_id = 'aa';
delete from user where user_id = 'aa';

insert into user (user_id , user_password , user_name, user_birthday, user_gender, user_grade)
values('aa','961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506','이승민','1995-12-27','남자','user');


insert into user (user_id , user_password , user_name, user_birthday, user_gender, user_phone ,user_email ,user_postcode, user_roadAddress, user_detailAddress ,user_extraAddress ,user_grade )
values('lsu878','6d241981d0d5a99da5f746a368c0a6f5bd6765b91536573bf25a59578da4184b','이승욱','1995-12-27','남자','010-9050-7094','lsu878@gmail.com','61175','광주 북구 면앙로31번길 10','101-901','(문흥동, 우산아파트)','admin');





drop table user;
drop table board;

CREATE TABLE test (
test_INT INT(11) NOT NULL,
test_TEXT VARCHAR(50) NOT NULL,
test_DATE DATE NOT NULL,
test_DOUBLE DOUBLE NOT NULL,
PRIMARY KEY (test_INT)
)

INSERT INTO test (test_INT, test_TEXT, test_DATE,test_DOUBLE) VALUES ('1', '텍스트1', '2017-08-27','1.23');
INSERT INTO test (test_INT, test_TEXT, test_DATE, test_DOUBLE) VALUES ('2', '텍스트2', '2017-08-27', '0.55');