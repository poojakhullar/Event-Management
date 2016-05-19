select * from EVENT_USERS;
select * from EVENT_REGISTER;
select * from events;
alter table event_users add column role varchar(15);
update event_users set user_id='admin';
update event_users set password='nimda';
drop table events;


ALTER TABLE EVENTS ADD COLUMN PARTICIPANTS INTEGER;

update events set PARTICIPANTS=20 where event_Id=1001;
alter table events alter event_start_date set data type timestamp;
insert into events values(1001,'ChessPuzzle','Puzzle',current TIMESTAMP,current TIMESTAMP,'Y',12);
insert into events(event_id,event_name,event_type) values(1001,'ChessPuzzle','Puzzle');




select * from events;
delete from events where event_id in(50550,50600);
alter table events add primary key(event_id);
alter table events alter column event_id not null
 ---24/09/2014 
create sequence SEQ_EVENTID start with 1010;
VALUES NEXT VALUE FOR seq_eventId;
DROP SEQUENCE seq_eventId RESTRICT;
drop table HIBERNATE_UNIQUE_KEY;
create table HIBERNATE_UNIQUE_KEY(NEXT_HI integer)
insert into hibernate_unique_key values(1010);
---25/09/2014
---28/09/2014
alter table event_register drop column event_type;
alter table event_register alter column event_id not null
ALTER TABLE "USER"."EVENT_REGISTER" ADD CONSTRAINT "SQL140921005242310" PRIMARY KEY ("USER_ID","EVENT_ID");
alter table event_register drop column event_name;
--30/09/2014
-----------------RUN THE FOLLOWING QUERIES
create table event_register(user_id varchar(20), first_name varchar(20), last_name varchar(20), event_id varchar(20),email_id varchar(30),phone varchar(10),primary key("USER_ID","EVENT_ID"))
create table events(EVENT_ID integer, EVENT_NAME varchar(30), EVENT_TYPE varchar(50), EVENT_START_DATE TIMESTAMP, EVENT_END_DATE TIMESTAMP,APPROVED VARCHAR(3),PARTICIPANTS INTEGER,HOST VARCHAR(25));
create table event_users(user_id varchar(20) primary key,password varchar(20),first_name varchar(15),last_name varchar(15),user_mailid varchar(30),role varchar(15));

insert into event_users(user_id,password,first_name,role) values('admin','nimda','Admin','admin');

create table HIBERNATE_UNIQUE_KEY(NEXT_HI integer)
insert into hibernate_unique_key values(1010);
------10/10/2014
DELETE FROM EVENTS;
delete from event_register;
