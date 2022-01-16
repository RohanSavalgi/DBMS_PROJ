drop table departments;

CREATE TABLE departments (
  ID           NUMBER(10)    NOT NULL,
  DESCRIPTION  VARCHAR2(50)  NOT NULL);

DROP SEQUENCE dept_seqs;
CREATE SEQUENCE dept_seqs START WITH 100;

CREATE OR REPLACE TRIGGER dept_bir 
BEFORE INSERT ON departments 
FOR EACH ROW

BEGIN
  SELECT dept_seqs.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

desc departments;

Insert into departments(DESCRIPTION) values('rohan');
Insert into departments(DESCRIPTION) values('roheee');
Insert into departments(DESCRIPTION) values('efef');
Insert into departments(DESCRIPTION) values('hhh');
Insert into departments(DESCRIPTION) values('ioajj');
Insert into departments(DESCRIPTION) values('jsgjkasdng');
Insert into departments(DESCRIPTION) values('ffffffff');
Insert into departments(DESCRIPTION) values('ggrgrgrgrg');

drop table CANCELLED_RIDES;
drop table RIDES;
drop table PASSENGERS;
drop table DRIVERS;
drop table VEHICLE;

CREATE TABLE VEHICLE (
    Veh_name VARCHAR2(10),
    Veh_type VARCHAR2(10),
    Veh_number VARCHAR2(30),
    PRIMARY KEY (Veh_number)
);

CREATE TABLE DRIVERS (
    Drv_id INTEGER PRIMARY KEY ,
    Drv_fname VARCHAR(20),
    Drv_lname VARCHAR(20),
    Drv_contact NUMBER(10),
    Veh_number REFERENCES VEHICLE(Veh_number) ON DELETE CASCADE
);

CREATE TABLE PASSENGERS (
    Pass_id INTEGER PRIMARY KEY,
    Pass_fname VARCHAR(10),
    Pass_lname VARCHAR(10),
    Pass_contact NUMBER(10)
);

CREATE TABLE RIDES (
    Ride_id INTEGER PRIMARY KEY,
    DateTime_start TIMESTAMP,
    DateTime_end TIMESTAMP,
    Pickup_loc VARCHAR(10),
    Drop_loc VARCHAR(10),
    Fare INTEGER,
    
    Distance FLOAT, 
    Drv_id REFERENCES DRIVERS(Drv_id) ON DELETE CASCADE,
    Pass_id REFERENCES PASSENGERS(Pass_id) ON DELETE CASCADE
);
CREATE TABLE CANCELLED_RIDES (
    Reason VARCHAR(50),
    Ride_id REFERENCES RIDES (Ride_id) ON DELETE CASCADE,
    Pass_id REFERENCES PASSENGERS (Pass_id) ON DELETE CASCADE,
    Drv_id REFERENCES DRIVERS (Drv_id) ON DELETE CASCADE,
    PRIMARY KEY (Ride_id,Pass_id,Drv_id)
);

drop sequence driver_seqs;
drop sequence pass_seqs;
drop sequence ride_seqs;

CREATE SEQUENCE driver_seqs START WITH 51 INCREMENT BY 1;
CREATE SEQUENCE pass_seqs START WITH 1001;
CREATE SEQUENCE ride_seqs START WITH 101;

CREATE OR REPLACE TRIGGER driver_tir 
BEFORE INSERT ON DRIVERS 
FOR EACH ROW
  WHEN (new.Drv_id IS NULL)
BEGIN
  :new.Drv_id := driver_seqs.NEXTVAL;
  
END;
/

select * from user_errors;

CREATE OR REPLACE TRIGGER pass_bir 
BEFORE INSERT ON PASSENGERS 
FOR EACH ROW
BEGIN
  :new.Pass_id := pass_seqs.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER ride_bir 
BEFORE INSERT ON rides 
FOR EACH ROW
BEGIN
  :new.Ride_id := ride_seqs.NEXTVAL;
END;
/

insert into VEHICLE values('Alto','Hatchback','KA02MZ5003');
insert into VEHICLE values('Hector','SUV','KA02MZ2343');
insert into VEHICLE values('Swift','Hatchback','KA02MZ2213');
insert into VEHICLE values('Honda City','Sedan','KA02MZ3067');
insert into VEHICLE values('Kodiaq','SUV','KA02MZ1234');

insert into DRIVERS(Drv_fname, Drv_lname, Drv_contact, Veh_number) values('Nograj','Sait',9731387331,'KA02MZ5003');
insert into DRIVERS(Drv_fname, Drv_lname, Drv_contact, Veh_number) values('Suresh','Kumar',9900717334,'KA02MZ2213');
insert into DRIVERS(Drv_fname, Drv_lname, Drv_contact, Veh_number) values('Ramesh','Rao',9880599192,'KA02MZ2343');
insert into DRIVERS(Drv_fname, Drv_lname, Drv_contact, Veh_number) values('Santosh','Hegde',8867549526,'KA02MZ1234');
insert into DRIVERS(Drv_fname, Drv_lname, Drv_contact, Veh_number) values('Brijesh','Patil',9449252192,'KA02MZ3067');

insert into PASSENGERS (Pass_fname,Pass_lname,Pass_contact) values('Sunita','Galagali',9535243088);
insert into PASSENGERS (Pass_fname,Pass_lname,Pass_contact) values('Rita','Raj',8827535625);
insert into PASSENGERS (Pass_fname,Pass_lname,Pass_contact) values('Sita','Mandal',9283838229);
insert into PASSENGERS (Pass_fname,Pass_lname,Pass_contact) values('Ankita','Rathod',7725256152);
insert into PASSENGERS (Pass_fname,Pass_lname,Pass_contact) values('Smita','NB',9143728636);

insert into RIDES(DateTime_start, DateTime_end, Pickup_loc,Drop_loc,Fare,Distance,Drv_id,Pass_id) values (to_date('2010-12-14:09:56:53', 'YYYY-MM-DD:HH24:MI:SS'), to_date('2010-12-14:10:56:53', 'YYYY-MM-DD:HH24:MI:SS'), 'RR NAGAR','JP NAGAR',160,1.3,51,1001);
insert into RIDES(DateTime_start, DateTime_end, Pickup_loc,Drop_loc,Fare,Distance,Drv_id,Pass_id) values (to_date('2022-01-06 16:30:22', 'YYYY-MM-DD:HH24:MI:SS'), to_date('2022-01-06 16:00:20', 'YYYY-MM-DD:HH24:MI:SS'), 'JP NAGAR','RT NAGAR',200,2.4, 53, 1001);
insert into RIDES(DateTime_start, DateTime_end, Pickup_loc,Drop_loc,Fare,Distance,Drv_id,Pass_id) values (to_date('2022-01-07 15:00:29', 'YYYY-MM-DD:HH24:MI:SS'), to_date('2022-01-07 15:30:22', 'YYYY-MM-DD:HH24:MI:SS'), 'Kengeri','ACES',170,3.5,52, 1003);
insert into RIDES(DateTime_start, DateTime_end, Pickup_loc,Drop_loc,Fare,Distance,Drv_id,Pass_id) values (to_date('2022-01-08 09:30:22', 'YYYY-MM-DD:HH24:MI:SS'), to_date('2022-01-08 10:30:22', 'YYYY-MM-DD:HH24:MI:SS'), 'BSK','KSIT',60,6.6, 54, 1005);
insert into RIDES(DateTime_start, DateTime_end, Pickup_loc,Drop_loc,Fare,Distance,Drv_id,Pass_id) values (to_date('2022-01-08 20:30:59', 'YYYY-MM-DD:HH24:MI:SS'), to_date('2022-01-08 23:30:22', 'YYYY-MM-DD:HH24:MI:SS'), 'Jainagar','Kormagala',110,2.7,52, 1002);

insert into CANCELLED_RIDES(Reason,Ride_id,Pass_id,Drv_id) values('Late Arrival',101,1002,51);
insert into CANCELLED_RIDES(Reason,Ride_id,Pass_id,Drv_id) values('Other Reasons',103,1004,54);
insert into CANCELLED_RIDES(Reason,Ride_id,Pass_id,Drv_id) values('Network Issues',102,1001,52);

CREATE TABLE CANCELLED_RIDES (
    Reason VARCHAR(50),
    Ride_id REFERENCES RIDES (Ride_id) ON DELETE CASCADE,
    Pass_id REFERENCES PASSENGERS (Pass_id) ON DELETE CASCADE,
    Drv_id REFERENCES DRIVERS (Drv_id) ON DELETE CASCADE,
    PRIMARY KEY (Ride_id,Pass_id,Drv_id)
);
