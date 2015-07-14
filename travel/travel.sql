drop table line;
create table line(
   lineid number(5) primary key,   --경로 고유번호 
   startpoint varchar2(50),        --출발지명
   endpoint varchar2(50) ,         --도착지명
   readcount number(10)		       --readcount   
);
drop table planner;
create table planner(
   plannerid number(5) primary key,--플래너 고유번호
   plannername varchar2(300),      --플래너명
   memberid varchar2(15),         --회원ID
   ongoing number(5)            --진행중여부
);
drop table planners;
create table planners(
   plannerid number(5),              --플래너 고유번호
   local varchar2(20),                    --경로 고유번호
   regdate date,                       --날짜
   lineorder number(5),                  --경로순서
   day number(5)               --몇박몇일
);
drop table schedule;
create table schedule(
   scheduleid number(5) primary key,--일정표 고유번호
   plannername varchar2(300),       --플래너명
   memberid varchar2(15),           --회원ID
   hotid number(5),                  --추천:고유번호
   dday number(5)               --몇일차
);
create table member(
   memberid varchar2(15) primary key,--회원ID
   password varchar2(20),         --비밀번호
   membername varchar2(20),      --회원이름
   email varchar2(30),            --이메일
   phone varchar2(20)            --핸드폰번호
);
create table board(
   boardid number(10) primary key, --게시판 고유번호
   memberid varchar2(15),         --멤버 ID
   title varchar2(50),            --제목
   content varchar2(3000),         --내용
   regdate date,               --날짜
   readcount number(10)         --readcount
);

create table area(
   local varchar2(50) primary key,--지역 고유명 area를 local로 변경
   localcontent varchar2(3000),      --지역설명 area를 local로 변경
   x number(20,10),               --좌표  X
   y number(20,10),               --좌표 Y
   areaimage varchar2(50)         --지역이미지
);


create table hot(
   hotid number(5) primary key,   --추천 고유번호
   hotname varchar2(50),         --추천이름
   hotprice number(10),         --추천가격
   hotcontent varchar2(3000),      --추천설명
   hotimage varchar2(50),         --추천이미지
   hotkind number(5),            --추천종류
   x number(20,10),               --좌표 X
   y number(20,10),               --좌표 Y
   local varchar2(50),         --지역:지역고유번호(지역명) area를 local로 변경 
   readcount number(10),         --readcount
   memberid varchar2(15)       --회원아이디
);


select * from schedule s, hot h where s.hotid =h.hotid and s.memberid='a' and plannername='놀자!' and local='대전'
select * from schedule s,hot h where s.hotid =h.hotid and local='서울' and plannerName='놀자!';
select local from planners where plannerid = 1 and lineorder=2;
select * from schedule s,hot h where s.hotid =h.hotid and local='서울'
select nvl(*,0) from schedule s, hot h where s.hotid=h.hotid and h.memberid='a' and s.plannername='놀자!';
select hotid from hot where y=#{x}
select hotid from hot where x=126.9796405;
select * from schedule;
select * from planners;
select * from hot;
select * from schedule s, hot h where s.hotid=h.hotid and h.memberid='a' and s.plannername='놀자!' and s.dday=1;
update hot set local='서울';
select * from planner;
insert into area values('seoul','asdfa',126.9783881,37.5666102,'aa.jpg');
insert into area values('daejun','asdfa',127.3849508,36.3504395,'aa.jpg');
insert into area values('daegu','asdfa',128.6017630,35.8713900,'aa.jpg');
insert into area values('busan','asdfa',129.0750222,35.1798159,'aa.jpg');


select * from planners p,area a where plannerid = 1 and p.local = a.local order by lineorder;
select * from PLANNERS where plannerid = 9;
select count(*) from planners where plannerid =1;
select plannername from planner where plannerid = 1;
select * from planner;

insert into schedule values(1,'놀자1','a',1,1);
insert into schedule values(2,'놀자1','a',2,2);
insert into schedule values(3,'놀자1','a',3,3);
insert into schedule values(4,'놀고옴1','a',1,1);
insert into schedule values(5,'놀고옴1','a',2,2);
insert into schedule values(6,'놀고옴1','a',3,3);
insert into schedule values(7,'놀고옴2','a',1,1);
insert into schedule values(8,'놀고옴2','a',2,2);
insert into schedule values(9,'놀고옴2','a',3,3);
insert into schedule values(10,'놀자1','a',1,1);
insert into schedule values(11,'놀고옴1','a',2,2);
insert into schedule values(12,'놀고옴2','a',3,3);

select sum(h.hotprice) hotprice from schedule s , hot h where s.hotid=h.hotid and h.hotkind=3
  			and s.memberid='a' and plannername='놀자1' ;
insert into hot values(1,'taste',12000,'정말정말맛있다 이놈아','cc.jpg',1,126.9634864,37.5296492,'seoul',1,'a');
insert into hot values(2,'kyungbook',13000,'정말정말맛있다 이놈아','cc.jpg',2,127.0089477,37.565755,'seoul',1,'a');
insert into hot values(3,'hotel',14000,'정말정말맛있다 이놈아','cc.jpg',3,126.9783868,37.5666263,'seoul',1,'a');
insert into hot values(4,'맛집1',15000,'정말정말맛있다 이놈아','cc.jpg',2,25.000,26.000,'서울',6,'a');
insert into hot values(5,'관광지1',16000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'대구',8,'a');
insert into hot values(6,'숙박1',17000,'정말정말맛있다 이놈아','cc.jpg',1,25.000,26.000,'부산',10,'a');
insert into hot values(7,'맛집2',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(8,'관광지2',19000,'정말정말맛있다 이놈아','cc.jpg',1,25.000,26.000,'대구',45,'a');
insert into hot values(9,'숙박3',20000,'정말정말맛있다 이놈아','cc.jpg',2,25.000,26.000,'부산',86,'a');
insert into hot values(10,'숙박4',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(11,'숙박5',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(12,'숙박6',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(13,'숙박7',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(14,'숙박8',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(15,'숙박9',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(16,'숙박10',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(17,'숙박11',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(18,'숙박12',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into hot values(19,'숙박13',18000,'정말정말맛있다 이놈아','cc.jpg',3,25.000,26.000,'서울',15,'a');
insert into area values('서울','서울내용내용내용내용서울내용내용',25.000,26.000,'cc.jpg');
insert into area values('대구','대구내용내용내용내용서울내용내용',25.000,26.000,'cc.jpg');
insert into area values('부산','부산내용내용내용내용서울내용내용',25.000,26.000,'cc.jpg');
insert into schedule values(1,'놀자1','a',1,1);
insert into schedule values(2,'놀자1','a',2,2);
insert into schedule values(3,'놀자1','a',3,3);
insert into schedule values(4,'놀고옴1','a',1,1);
insert into schedule values(5,'놀고옴1','a',2,2);
insert into schedule values(6,'놀고옴1','a',3,3);
insert into schedule values(7,'놀고옴2','a',1,1);
insert into schedule values(8,'놀고옴2','a',2,2);
insert into schedule values(9,'놀고옴2','a',3,3);
insert into schedule values(10,'놀자1','a',1,1);
insert into schedule values(11,'놀고옴1','a',2,2);
insert into schedule values(12,'놀고옴2','a',3,3);
insert into line values(1,'서울','대구',1);
insert into line values(2,'대구','부산',1);
insert into line values(3,'부산','서울',1);


select to_char(regdate,'yyyy-mm-dd') from planners where plannerid = 1 and lineorder = 1