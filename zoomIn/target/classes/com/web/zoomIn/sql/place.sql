delete from place_reply;
update place set place_reply_count=0;
update place set place_grade_avg=0;

select * from place order by place_grade_avg desc
select * from place order by place_reply_count desc
select * from place order by place_view desc

CREATE TABLE place
(
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
) COMMENT = '새 테이블';

drop table place;

alter table place add place_view int not null default 0;
alter table place add place_grade_avg double not null default 0;
alter table place add place_description varchar(200);



CREATE TABLE place_reply (
reply_code int NOT NULL AUTO_INCREMENT,
place_code int NOT NULL,
user_id varchar(300),
reply_content text NOT NULL,
reply_date timestamp default now(),
reply_grade int not null default 0,
primary key(reply_code, place_code),
foreign key(place_code) references place(place_code) ); 

alter table place add place_reply_count int not null default 0;

alter table place_reply modify user_id varchar(20) not null;
alter table place_reply modify reply_grade int not null default 0;
alter table place_reply modify reply_date timestamp not null default now();

insert into place_reply(place_code, user_id, reply_content, reply_grade )
value(1, "aa", "최고에요", 5);

insert into place_reply(place_code, user_id, reply_content, reply_grade )
value(1, "aa", "별로에요", 1);

insert into place_reply(place_code, user_id, reply_content, reply_grade )
value(1, "aa", "보통에요", 3);


CREATE TABLE keyword
(
	keyword_content varchar(50)not null PRIMARY KEY
) ;

drop table keyword;

create table place_keyword(
	place_keyword_code int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	place_code int NOT NULL,
	keyword_content varchar(50) NOT NULL,
	foreign key(place_code) references place(place_code),
	foreign key(keyword_content) references keyword(keyword_content)
)

drop table place_keyword;

insert into place_keyword (place_code,keyword_content) value(1, '한식');
insert into place_keyword (place_code,keyword_content) value(1, '한우');
insert into place_keyword (place_code,keyword_content) value(1, '신선함');
insert into place_keyword (place_code,keyword_content) value(1, '맛집');


select place_code , keyword_content from place_keyword  where place_code=1
