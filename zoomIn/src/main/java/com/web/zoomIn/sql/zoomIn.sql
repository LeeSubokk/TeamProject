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

CREATE TABLE place(
place_code int NOT NULL AUTO_INCREMENT COMMENT '코드',
place_name varchar(50) NOT NULL COMMENT '장소 이름',
place_address varchar(50) NOT NULL COMMENT '장소 주소',
place_tell varchar(20) COMMENT '장소 전화번호',
place_business_hours varchar(20) NOT NULL COMMENT '장소 영업시간',
category_name varchar(10) COMMENT '장소 카테고리',
place_view int not null default 0,
place_grade_avg double not null default 0,
place_reply_count int not null default 0,
place_description varchar(200)
PRIMARY KEY (place_code)
)

CREATE TABLE place_reply (
reply_code int NOT NULL AUTO_INCREMENT,
place_code int NOT NULL,
user_id varchar(300),
reply_content text NOT NULL,
reply_date timestamp default now(),
reply_grade int not null default 0,
primary key(reply_code, place_code),
foreign key(place_code) references place(place_code) );

CREATE TABLE keyword(
keyword_content varchar(50)not null PRIMARY KEY
) ;

create table place_keyword(
place_keyword_code int NOT NULL PRIMARY KEY AUTO_INCREMENT,
place_code int NOT NULL,
keyword_content varchar(50) NOT NULL,
foreign key(place_code) references place(place_code),
foreign key(keyword_content) references keyword(keyword_content)
)


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
